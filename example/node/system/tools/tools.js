import winston from  'winston';
import path from "path";
import url from "url";
import validate from "joi";

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

  function validator(body, data) {
    if (Object.keys(body).length == 0) {
      return Object.keys(body).length + "Body not required";
    }
  
    const schema = validate.object(data);
    const { error, value } = schema.validate(body || {}, { abortEarly: false });
  
    if (error) {
      return error.details[0].message;
    } else {
      return true;
    }
  }



export default {log,tempPath,validator}