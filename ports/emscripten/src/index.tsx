import React from "react";
import { createRoot } from "react-dom/client";
import { App } from "./App";
import 'bootstrap/dist/css/bootstrap.min.css';

const container = document.querySelector("#root");

if (container) {
  const root = createRoot(container);
  root.render(<App />);
}
