const say = async () => EmscriptenEnvironment;

interface EmscriptenEnvironment {
  callMain(argv: string[]): number;
  FS: EmscriptenFileSystem;
}

interface EmscriptenFileSystem {
  readFile(
    path: string,
    opts?: { encoding?: "binary" | "utf8"; flags?: "r" | "w" }
  ): Uint8Array;
}

export type { EmscriptenEnvironment, EmscriptenFileSystem };
export { say };
