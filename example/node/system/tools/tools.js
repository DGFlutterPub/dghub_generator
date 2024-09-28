import winston from  'winston';
import path from "path";
import url from "url";

const tempPath = path.join(
    url.fileURLToPath(import.meta.url),
    "../../storage/.temp/"
  );


  const log = winston.createLogger({
    transports: [
     new winston.transports.Console({
        format: winston.format.combine(
            winston.format.colorize(),
            winston.format.simple()
          )
      }),
      new winston.transports.File({
        format: winston.format.combine(
            winston.format.timestamp(),
            winston.format.json()
        ),
        filename: 'error.log', level: 'error' }),
    ],
  });


export default {log,tempPath}