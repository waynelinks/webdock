let xhr = new XMLHttpRequest();
xhr.open("GET", "/config.json", false);
xhr.send();

if (xhr.status !== 200) {
  throw new Error("Missing runtime configuration.");
}
let runtimeConfiguration = JSON.parse(xhr.responseText);

/** @type {string} */
let env = runtimeConfiguration.env || "production";
/** @type {string} */
let version = runtimeConfiguration.version || "undefined";

console.error("App logs some stuff.");

document.write("<p>Hello world!</p>");
