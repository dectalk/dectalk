import { EmscriptenEnvironment } from "./build/say";

class DECtalk {
  constructor(private emscripten: EmscriptenEnvironment) {}

  public say(input: string): Uint8Array {
    const filename = Date.now() + ".wav";
    this.emscripten.callMain([filename, input]);
    return this.emscripten.FS.readFile(filename);
  }
}

export { DECtalk }
