import { benches } from "./routes/bench";
const env = require("dotenv").config();

var express = require("express");
var app = express();
app.disable("etag"); // No caching

app.get("/", function (req: any, res: any) {
  console.log("Getting base");
  res.send("Geobench API server");
});

benches(app);

app.listen(process.env.EXPRESS_PORT);
