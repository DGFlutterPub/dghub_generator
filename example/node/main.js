import "dotenv/config";
process.env.TZ = "Asia/Yangon";
import express from "express";
import formData from "express-form-data";
import http from "http";
import schedule from "node-schedule";
import apiRoutes from "./routes/api_routes.js";
import webRoutes from "./routes/web_routes.js";
import socketRoutes from "./routes/socket_routes.js";
import cronRoutes from "./routes/cron/cron_routes.js";
import { Server } from "socket.io";
import header from "./system/express/header.js";
import errorHandler from "./system/express/error_handler.js";
import cors from "cors";
import migration from "./migration/migration.js";
import route from "./routes/api_routes.js";
import database from  './system/database/database.js';
import global from "./config/global.js";

database();

cronRoutes(schedule);

console.log(global.apiUrl);

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
    tools.log.info("[HOST] => URL:" + process.env.HOST);
    tools.log.info("[LISTENING] => PORT: " + process.env.PORT);
  })
  .on("error", (e) => {
    tools.log.error(e.message);
    tools.log.error("[LISTENING] => ERROR:" + process.env.PORT);
  });
