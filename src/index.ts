import { Request, Response } from "express";
import { getRoutes } from "./services/routes";
import { webServices } from "./services/web";
const env = require("dotenv").config();

const fs = require("fs");
const http = require("http");
const https = require("https");
const express = require("express");
const bodyParser = require("body-parser");
const app = express();

app.use(express.static(__dirname, { dotfiles: "allow" }));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(bodyParser.raw());
app.disable("etag"); // No caching
app.use((req: any, res: any, next: any) => {
  res.append("version", process.env.VERSION);
  next();
});

app.get("/", function (req: Request, res: Response) {
  res.status(200).json({ "geobench-server": { version: process.env.VERSION } });
});

const routes = getRoutes();
routes.forEach((route: string) => {
  import("./routes/" + route).then((r: any) => {
    r.default(app);
  });
});

webServices({
  app: app,
  usingHttps: true,
  httpsDomain: "api.geobench.turtlecorp.fr",
});
