import { benches } from "./routes/benches";
import { community } from "./routes/community";
import { user } from "./routes/user";
const env = require("dotenv").config();

const fs = require("fs");
const http = require("http");
const https = require("https");
const express = require("express");
const bodyParser = require("body-parser");
const app = express();

// Certbot Certifiates
const privateKey = fs.readFileSync(
  "/etc/letsencrypt/live/api.geobench.turtlecorp.fr/privkey.pem",
  "utf8"
);
const certificate = fs.readFileSync(
  "/etc/letsencrypt/live/api.geobench.turtlecorp.fr/cert.pem",
  "utf8"
);
const ca = fs.readFileSync(
  "/etc/letsencrypt/live/api.geobench.turtlecorp.fr/chain.pem",
  "utf8"
);

const credentials = {
  key: privateKey,
  cert: certificate,
  ca: ca,
};

app.use(express.static(__dirname, { dotfiles: "allow" }));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(bodyParser.raw());
app.disable("etag"); // No caching

app.get("/", function (req: any, res: any) {
  res.status(200).json({ "greengo-server": { version: "1.0.0" } });
});

benches(app);
user(app);
community(app);

//const httpServer = http.createServer(app);
const httpsServer = https.createServer(credentials, app);

// httpServer.listen(80, () => {
//   console.log("HTTP Server running on port 80");
// });

httpsServer.listen(443, () => {
  console.log("HTTPS Server running on port 443");
});
