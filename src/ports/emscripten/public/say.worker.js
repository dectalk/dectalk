/**
 * @license
 * Copyright 2015 The Emscripten Authors
 * SPDX-License-Identifier: MIT
 */

// Pthread Web Worker startup routine:
// This is the entry point file that is loaded first by each Web Worker
// that executes pthreads on the Emscripten application.

'use strict';

var Module = {};

// Node.js support
var ENVIRONMENT_IS_NODE = typeof process == 'object' && typeof process.versions == 'object' && typeof process.versions.node == 'string';
if (ENVIRONMENT_IS_NODE) {
  // Create as web-worker-like an environment as we can.

  var nodeWorkerThreads = require('worker_threads');

  var parentPort = nodeWorkerThreads.parentPort;

  parentPort.on('message', (data) => onmessage({ data: data }));

  var fs = require('fs');

  Object.assign(global, {
    self: global,
    require: require,
    Module: Module,
    location: {
      href: __filename
    },
    Worker: nodeWorkerThreads.Worker,
    importScripts: function(f) {
      (0, eval)(fs.readFileSync(f, 'utf8'));
    },
    postMessage: function(msg) {
      parentPort.postMessage(msg);
    },
    performance: global.performance || {
      now: function() {
        return Date.now();
      }
    },
  });
}

// Thread-local guard variable for one-time init of the JS state
var initializedJS = false;

// Proxying queues that were notified before the thread started and need to be
// executed as part of startup.
var pendingNotifiedProxyingQueues = [];

function assert(condition, text) {
  if (!condition) abort('Assertion failed: ' + text);
}

function threadPrintErr() {
  var text = Array.prototype.slice.call(arguments).join(' ');
  // See https://github.com/emscripten-core/emscripten/issues/14804
  if (ENVIRONMENT_IS_NODE) {
    fs.writeSync(2, text + '\n');
    return;
  }
  console.error(text);
}
function threadAlert() {
  var text = Array.prototype.slice.call(arguments).join(' ');
  postMessage({cmd: 'alert', text: text, threadId: Module['_pthread_self']()});
}
// We don't need out() for now, but may need to add it if we want to use it
// here. Or, if this code all moves into the main JS, that problem will go
// away. (For now, adding it here increases code size for no benefit.)
var out = () => { throw 'out() is not defined in worker.js.'; }
var err = threadPrintErr;
self.alert = threadAlert;

Module['instantiateWasm'] = (info, receiveInstance) => {
  // Instantiate from the module posted from the main thread.
  // We can just use sync instantiation in the worker.
  var instance = new WebAssembly.Instance(Module['wasmModule'], info);
  receiveInstance(instance, Module['wasmModule']);
  // We don't need the module anymore; new threads will be spawned from the main thread.
  Module['wasmModule'] = null;
  return instance.exports;
}

// Turn unhandled rejected promises into errors so that the main thread will be
// notified about them.
self.onunhandledrejection = (e) => {
  throw e.reason ?? e;
};

self.onmessage = (e) => {
  try {
    if (e.data.cmd === 'load') { // Preload command that is called once per worker to parse and load the Emscripten code.

      // Module and memory were sent from main thread
      Module['wasmModule'] = e.data.wasmModule;

      Module['dynamicLibraries'] = e.data.dynamicLibraries;

      Module['wasmMemory'] = e.data.wasmMemory;

      Module['buffer'] = Module['wasmMemory'].buffer;

      Module['ENVIRONMENT_IS_PTHREAD'] = true;

      if (typeof e.data.urlOrBlob == 'string') {
        importScripts(e.data.urlOrBlob);
      } else {
        var objectUrl = URL.createObjectURL(e.data.urlOrBlob);
        importScripts(objectUrl);
        URL.revokeObjectURL(objectUrl);
      }
    } else if (e.data.cmd === 'run') {
      // This worker was idle, and now should start executing its pthread entry
      // point.
      // performance.now() is specced to return a wallclock time in msecs since
      // that Web Worker/main thread launched. However for pthreads this can
      // cause subtle problems in emscripten_get_now() as this essentially
      // would measure time from pthread_create(), meaning that the clocks
      // between each threads would be wildly out of sync. Therefore sync all
      // pthreads to the clock on the main browser thread, so that different
      // threads see a somewhat coherent clock across each of them
      // (+/- 0.1msecs in testing).
      Module['__performance_now_clock_drift'] = performance.now() - e.data.time;

      // Pass the thread address to wasm to store it for fast access.
      Module['__emscripten_thread_init'](e.data.pthread_ptr, /*isMainBrowserThread=*/0, /*isMainRuntimeThread=*/0, /*canBlock=*/1);

      assert(e.data.pthread_ptr);
      // Also call inside JS module to set up the stack frame for this pthread in JS module scope
      Module['establishStackSpace']();
      Module['PThread'].receiveObjectTransfer(e.data);
      Module['PThread'].threadInitTLS();

      if (!initializedJS) {

        // Execute any proxied work that came in before the thread was
        // initialized. Only do this once because it is only possible for
        // proxying notifications to arrive before thread initialization on
        // fresh workers.
        pendingNotifiedProxyingQueues.forEach(queue => {
          Module['executeNotifiedProxyingQueue'](queue);
        });
        pendingNotifiedProxyingQueues = [];
        initializedJS = true;
      }

      try {
        Module['invokeEntryPoint'](e.data.start_routine, e.data.arg);
      } catch(ex) {
        if (ex != 'unwind') {
          // ExitStatus not present in MINIMAL_RUNTIME
          if (ex instanceof Module['ExitStatus']) {
            if (Module['keepRuntimeAlive']()) {
              err('Pthread 0x' + Module['_pthread_self']().toString(16) + ' called exit(), staying alive due to noExitRuntime.');
            } else {
              err('Pthread 0x' + Module['_pthread_self']().toString(16) + ' called exit(), calling _emscripten_thread_exit.');
              Module['__emscripten_thread_exit'](ex.status);
            }
          }
          else
          {
            // The pthread "crashed".  Do not call `_emscripten_thread_exit` (which
            // would make this thread joinable.  Instead, re-throw the exception
            // and let the top level handler propagate it back to the main thread.
            throw ex;
          }
        } else {
          // else e == 'unwind', and we should fall through here and keep the pthread alive for asynchronous events.
          err('Pthread 0x' + Module['_pthread_self']().toString(16) + ' completed its main entry point with an `unwind`, keeping the worker alive for asynchronous operation.');
        }
      }
    } else if (e.data.cmd === 'cancel') { // Main thread is asking for a pthread_cancel() on this thread.
      if (Module['_pthread_self']()) {
        Module['__emscripten_thread_exit'](-1);
      }
    } else if (e.data.target === 'setimmediate') {
      // no-op
    } else if (e.data.cmd === 'processProxyingQueue') {
      if (initializedJS) {
        Module['executeNotifiedProxyingQueue'](e.data.queue);
      } else {
        // Defer executing this queue until the runtime is initialized.
        pendingNotifiedProxyingQueues.push(e.data.queue);
      }
    } else if (e.data.cmd) {
      // The received message looks like something that should be handled by this message
      // handler, (since there is a e.data.cmd field present), but is not one of the
      // recognized commands:
      err('worker.js received unknown command ' + e.data.cmd);
      err(e.data);
    }
  } catch(ex) {
    err('worker.js onmessage() captured an uncaught exception: ' + ex);
    if (ex && ex.stack) err(ex.stack);
    if (Module['__emscripten_thread_crashed']) {
      Module['__emscripten_thread_crashed']();
    }
    throw ex;
  }
};


