import React, { useRef, useState } from "react";
import { EmscriptenEnvironment } from "../../emscripten";
import { Form, Button } from "react-bootstrap";

const sleep = (timeout: number) => new Promise<void>((resolve) => setTimeout(() => resolve(), timeout))

const SpeakWindow = () => {
  const audioPlayer = useRef<HTMLAudioElement>(null);
  const [value, setValue] = useState<string>("");
  const [phonemeEnable, setPhonemeEnable] = useState<boolean>(true);
  const [audioFile, setAudioFile] = useState<string>("");
  const [isLoading, setIsLoading] = useState<boolean>(false);
  const [emscripten, setEmscriptenEnvironment] =
    useState<EmscriptenEnvironment | null>(null);

  const getSay = async () => {
    if (emscripten) return emscripten;
    const env = await say();
    setEmscriptenEnvironment(env);
    return env;
  };

  const commit = async () => {
    setIsLoading(true);
    const dectalk = await getSay();
    const outputFileName = Date.now() + ".wav";

    let input = "";

    if (phonemeEnable) {
      input += "[:phone on]\n"
    }

    input += value;

    const args = [outputFileName, input];
    console.log("Calling DECtalk with arguments", args);
    dectalk.callMain(args);

    while(true) {
      try {
        console.log("Attempting to read", outputFileName);
        const buffer = dectalk.FS.readFile(outputFileName);
        const blob = new Blob([buffer], { type: "audio/x-wav" });
    
        // Pause the audio player if it is playing...
        audioPlayer.current?.pause();
    
        console.log("Loading file", outputFileName);
        // Create a blob URL and reload it if
        setAudioFile(URL.createObjectURL(blob));

        await sleep(100);

        audioPlayer.current?.load();
        audioPlayer.current?.play();
        setIsLoading(false);
        break;
      } catch {
        console.log("Failed to read - Will wait 1000ms.", outputFileName);
        await sleep(1000);
      }
    }
  };

  return (
    <Form as="div" className="py-4">
      <Form.Group className="mb-3" controlId="SpeakWindow.Phoneme">
        <Form.Label>Enable Phonemes</Form.Label>
        <Form.Check
          checked={phonemeEnable}
          onChange={(e) => setPhonemeEnable(e.target.checked)}
          disabled={isLoading}
        />
        <Form.Text muted>
          This option configures whether <code>[:phone on]</code> is prefixed to your input, for singing.
        </Form.Text>
      </Form.Group>
      <Form.Group className="mb-3" controlId="SpeakWindow.Text">
        <Form.Label>DECtalk Input</Form.Label>
        <Form.Control
          as="textarea"
          rows={12}
          value={value}
          onChange={(e) => setValue(e.target.value)}
          disabled={isLoading}
        />
      </Form.Group>
      <Button
        variant="primary"
        type="submit"
        disabled={isLoading}
        onClick={commit}
      >
        Submit
      </Button>

      <Form.Group className="py-4" style={audioFile ? {} : { visibility: "hidden" }}>
        <audio ref={audioPlayer} controls>
          {audioFile && <source src={audioFile} type="audio/x-wav" />}
        </audio>
      </Form.Group>
    </Form>
  );

  // <main>
  //     <textarea
  //       value={value}
  //       onChange={(e) => setValue(e.target.value)}
  //     ></textarea>

  //     <button onClick={commit}>Commit</button>

  // <audio ref={audioPlayer} controls>
  //   {audioFile && <source src={audioFile} type="audio/x-wav" />}
  // </audio>
  //   </main>
};

export { SpeakWindow };
