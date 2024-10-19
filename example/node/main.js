import "dotenv/config";
process.env.TZ = "Asia/Yangon";
import express from "express";
import formData from "express-form-data";
import http from "http";
import schedule from "node-schedule";
import apiRoutes from "./routes/api_routes.js";
import webRoutes from "./routes/web_routes.js";
import socketRoutes from "./routes/socket_routes.js";
import cronRoutes from "./routes/cron_routes.js";
import { Server } from "socket.io";
import header from "./system/express/header.js";
import errorHandler from "./system/express/error_handler.js";
import cors from "cors";
import seeder from "./seeder/seeder.js";
import database from  './system/database/database.js';
import global from "./config/global.js";
import tools from "./system/tools/tools.js";

database();

tools.log.info('[API] => URL: '+global.apiUrl);

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


app.set('io',io);
app.use(header);

socketRoutes(io);
cronRoutes(schedule);
apiRoutes(app);
webRoutes(app);


//app.use(layouts);
//app.use(morgan('dev'));
app.use(errorHandler);

//---Seeder
seeder();

//--Socket file upload
//app.use(sf.router);

//--Listen
server
  .listen(global.port, global.host, function () {
    tools.log.info("[HOST] => URL: " + global.host);
    tools.log.info("[LISTENING] => PORT: " + global.port);
  })
  .on("error", (e) => {
    tools.log.error(e.message);
    tools.log.error("[LISTENING] => ERROR: " + global.port);
  });
