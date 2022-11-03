import React, { useRef, useState } from "react";
import { EmscriptenEnvironment } from "./emscripten";

const App = () => {
  const audioPlayer = useRef<HTMLAudioElement>(null);
  const [value, setValue] = useState<string>("");
  const [audioFile, setAudioFile] = useState<string>("");
  const [emscripten, setEmscriptenEnvironment] = useState<EmscriptenEnvironment | null>(null);
  
  const getSay = async () => {
    if (emscripten) return emscripten;
    const env = await say();
    setEmscriptenEnvironment(env);
    return env;
  }

  const commit = async () => {
    const dectalk = await getSay();
    const outputFileName = Date.now() + ".wav"
    console.log(outputFileName);

    dectalk.callMain([outputFileName, value]);
    const buffer = dectalk.FS.readFile(outputFileName)
    const blob = new Blob([buffer], { type: "audio/x-wav" });

    // Pause the audio player if it is playing...
    audioPlayer.current?.pause();

    // Create a blob URL and reload it if 
    setAudioFile(URL.createObjectURL(blob));
    audioPlayer.current?.load();
    audioPlayer.current?.play();
  }

  return (
    <main>
      <textarea
        value={value}
        onChange={(e) => setValue(e.target.value)}
      ></textarea>

      <button onClick={commit}>Commit</button>

      <audio ref={audioPlayer} controls>
        {audioFile && <source src={audioFile} type="audio/x-wav" />}
      </audio>
    </main>
  );
};

export { App };
