//import { createRequire } from "module";
//const require = createRequire(import.meta.url);
//import mySql from "./components/mysql.js";
import tools from "./components/tools.js";
tools.bluePrint("DGHub Studio");
tools.bluePrint(new Date().toLocaleString());
tools.bluePrint(tools.storagePath);
import "dotenv/config";
process.env.TZ = "Asia/Yangon";
import express from "express";
import formData from "express-form-data";
import http from "http";
import schedule from "node-schedule";
import apiRoutes from "./routes/api/api_routes.js";
import webRoutes from "./routes/web_routes.js";
import socketRoutes from "./routes/socket_routes.js";
import cronRoutes from "./routes/cron/cron_routes.js";
import { Server } from "socket.io";
import header from "./components/header.js";
import errorHandler from "./components/error_handler.js";
import cors from "cors";
import migration from "./migration/migration.js";
import route from "./routes/routes.js";
import database from  './components/database.js';


console.log(tools.bonusPrice({
balance: 5000,
bonus: 3000,
referral: 1000,
input:3500,

}));

database();

/*
var e = tools.encryptString("Thaung Sein");
var d = tools.decryptString("8LptWqM4g14Keue2FDsCfg==");
var d2 = tools.decryptString(e);
console.log(e);
console.log(d);*/


//translate();

cronRoutes(schedule);

console.log(process.env.URL+process.env.API_VERSION);
console.log(process.env.URL+process.env.SOCKET_VERSION);

const app = express();
var server = http.createServer(app);
var io = new Server(server, {
 // path: process.env.SOCKET_VERSION,
  cors: {
    origin: "*",
    credentials: false,
  },
});



const options = {
  uploadDir: tools.tempPath,
  autoClean: true,
};

const corsOptions = {
  origin: "*",
  optionsSuccessStatus: 200,
};

// ngnix - proxy_set_header X-Real-IP $remote_addr;
app.set("trust proxy", true);

app.set("view engine", "ejs");

app.use(cors(corsOptions));

app.use(formData.parse(options));

app.use("/storage", express.static("storage"));
app.use(express.static("web"));
//app.use(cors());

//---Socket
socketRoutes(io);

app.set('io',io);

app.use(header);
app.use(process.env.API_VERSION, apiRoutes);
app.use("/", webRoutes);
route(app);

//app.use(layouts);
//app.use(morgan('dev'));
app.use(errorHandler);

//---Migration
migration();

//--Socket file upload
//app.use(sf.router);

//--Listen
server
  .listen(process.env.PORT, process.env.HOST, function () {
    tools.greenPrint("[HOST] => URL:" + process.env.HOST);
    tools.greenPrint("[LISTENING] => PORT: " + process.env.PORT);
  })
  .on("error", (e) => {
    console.log(e.message);
    tools.redPrint("[LISTENING] => ERROR:" + process.env.PORT);
  });
