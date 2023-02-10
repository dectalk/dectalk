#!/usr/bin/env node
const esbuild = require("esbuild");
const http = require("http");
const { copy } = require("esbuild-plugin-copy");
const yargs = require("yargs/yargs");
const { hideBin } = require("yargs/helpers");

const argv = yargs(hideBin(process.argv))
  .option("--watch")
  .option("--production").argv;

const config = {
  entryPoints: ["./src/index.tsx"],
  bundle: true,
  outfile: "../../build/bin/index.js",
  plugins: [
    copy({
      // this is equal to process.cwd(), which means we use cwd path as base path to resolve `to` path
      // if not specified, this plugin uses ESBuild.build outdir/outfile options as base path.
      assets: {
        from: ["./public/*"],
        to: ["./"],
      },
    }),
  ],
  minify: !!argv.production,
};

if (argv.watch) {
  esbuild
    .serve(
      {
        servedir: "../../build/bin/",
      },
      config
    )
    .then((result) => {
      // The result tells us where esbuild's local server is
      const { host, port } = result;

      // Then start a proxy server on port 3000
      http
        .createServer((req, res) => {
          // Forward each incoming request to esbuild
          const proxyReq = http.request(
            {
              hostname: host,
              port: port,
              path: req.url,
              method: req.method,
              headers: req.headers,
            },
            (proxyRes) => {
              res.setHeader("Cross-Origin-Opener-Policy", "same-origin");
              res.setHeader("Cross-Origin-Embedder-Policy", "require-corp");
              res.writeHead(proxyRes.statusCode, proxyRes.headers);
              proxyRes.pipe(res, { end: true });
            }
          );

          // Forward the body of the request to esbuild
          req.pipe(proxyReq, { end: true });
        })
        .listen(3000);

      console.log("Listening on port 3000");
    });
} else {
  esbuild.build(config);
}
