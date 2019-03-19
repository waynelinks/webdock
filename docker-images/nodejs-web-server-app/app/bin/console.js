#!/usr/bin/env node

/** @type {string} */
let env = process.env.NODE_ENV || "production";
/** @type {string} */
let version = process.env.VERSION || "undefined";

console.error("App logs some stuff.");

console.log("Hello world!");
