import { benches } from "./routes/benches";
import { user } from "./routes/user";
import { returnCode } from "./utils/returnCodes";
const env = require("dotenv").config();

var express = require("express");
var app = express();
app.disable("etag"); // No caching

app.get("/", function (req: any, res: any) {
  res.status(200).json({ "greengo-server": { version: "1.0.0" } });
});

benches(app);
user(app);

app.listen(process.env.EXPRESS_PORT);
