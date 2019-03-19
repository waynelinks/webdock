#!/usr/bin/env node

let http = require("http");

/** @type {string} */
let env = process.env.NODE_ENV || "production";
/** @type {string} */
let version = process.env.VERSION || "undefined";

http.createServer(function (request, response) {
  response.setHeader("X-Version", version);

  console.error("App logs some stuff.");

  response.setHeader("Content-Type", "application/json");
  response.write(JSON.stringify({
    "message": "Hello world!"
  }));
  response.end();
}).listen(80);
