declare global {
  var say: Emscripten;
}

type Emscripten = () => Promise<EmscriptenEnvironment>;

class EmscriptenEnvironment {
  callMain(argv: string[]): number;
  FS: EmscriptenFileSystem;
}

class EmscriptenFileSystem {
  readFile(
    path: string,
    opts?: { encoding?: "binary" | "utf8"; flags?: "r" | "w" }
  ): Uint8Array
}

export type { Emscripten, EmscriptenEnvironment, EmscriptenFileSystem as FS };
