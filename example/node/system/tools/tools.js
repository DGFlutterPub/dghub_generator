import winston from  'winston';
import path from "path";
import url from "url";
import validate from "joi";
import fs from "fs";
import config from '../../config/global.js';
import jwt from "jsonwebtoken";
import bcrypt from "bcryptjs";

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


  async function fileToStorage(file, settings) {
    return await new Promise((resolve, reject) => {
      if (file == undefined) {
        return resolve({ error: true, value: "File not required" });
      }
      var id = new mongoose.Types.ObjectId();
      var ext = path.extname(file.name);
      var name = settings.name + "_" + id;
      var dir = settings.path;
      var fileName = dir + name + ext;
      console.log(storagePath + fileName);
  
      if (!fs.existsSync(storagePath + dir)) {
        fs.mkdirSync(storagePath + dir);
      }
  
      if (!settings.supports.includes(ext.replace(".", ""))) {
        return resolve({
          error: true,
          value: "Do not support mimetype " + settings.supports.toString(),
        });
      }
  
      if (settings.size < file.size) {
        return resolve({
          error: true,
          value: "File size is to big,Support size 1MB",
        });
      }
  
      fs.rename(file.path, storagePath + fileName, function (err) {
        if (err) {
          console.log(err.message);
          return resolve({ error: true, value: "File not moved" });
        }
        console.log("storage/" + fileName);
        return resolve({ error: false, value: "storage/" + fileName });
      });
    });
  }


  function getToken(id){

    return  jwt.sign({
      secretOrPrivateKey: config.publicKey,
      id: id,
    },
    config.secertKey,
    {
    expiresIn: '7d'
    });
    
    } 

    const createPassword = async (password) => {
      return await new Promise((resolve, reject) => {
        bcrypt
          .hash(password, 10)
          .then((hash) => {
            return resolve({ error: false, value: hash });
          })
          .catch((err) => resolve({ error: true, value: err.message }));
      });
    };
    const checkPassword = (password, hash) => {
      if (bcrypt.compareSync(password, hash || "")) {
        return { error: false, value: "Password is correct" };
      } else {
        return { error: true, value: "Password is wrong" };
      }
    };

export default {log,tempPath,validator,fileToStorage,getToken,createPassword,checkPassword}