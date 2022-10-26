import express from "express";
import path from "node:path";

const app = express();

console.log(`Serving up from ${path.join(__dirname)}`)

app
  .use((req, res, next) => {
    res.set("Cross-Origin-Opener-Policy", "same-origin");
    res.set("Cross-Origin-Embedder-Policy", "require-corp");
    next();
  })
  .use("/", express.static(path.join(__dirname, "..", "public")))
  .use("/", express.static(path.join(__dirname, "..", "..", "..")))
  .listen(8080)
