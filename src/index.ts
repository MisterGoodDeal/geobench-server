import { benches } from "./routes/benches";
import { community } from "./routes/community";
import { user } from "./routes/user";
const env = require("dotenv").config();

const express = require("express");
const bodyParser = require("body-parser");
const app = express();
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

app.listen(process.env.EXPRESS_PORT);
