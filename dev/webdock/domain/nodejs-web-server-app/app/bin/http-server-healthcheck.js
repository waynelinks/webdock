#!/usr/bin/env node

let request = require("sync-request");

let response = request("GET", "http://127.0.0.1:80/_ping");

if (response.statusCode !== 200) {
  process.exit(1);
}

process.exit(0);
