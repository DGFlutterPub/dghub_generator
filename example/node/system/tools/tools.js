import { AnsiLogger } from 'node-ansi-logger';
import path from "path";

const tempPath = path.join(
    fileURLToPath(import.meta.url),
    "../../storage/.temp/"
  );

const log = new AnsiLogger({logName: '<DGHub Studio>'});



export default {log,tempPath}