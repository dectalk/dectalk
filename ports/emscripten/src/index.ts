import { say } from "./build/say";
import { DECtalk } from "./DECtalk";

const dectalk = async () => {
  return new DECtalk(await say());
};

export default dectalk;
