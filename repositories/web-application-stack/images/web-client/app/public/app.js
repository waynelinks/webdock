var xhr = new XMLHttpRequest();
xhr.open("GET", "/config.json", false);
xhr.send();

if (xhr.status !== 200) {
  throw new Error('Missing runtime configuration.');
}
var runtimeConfiguration = JSON.parse(xhr.responseText);

/** @type {string} */
var version = typeof runtimeConfiguration.version === "undefined" ? "undefined" : runtimeConfiguration.version;
/** @type {string} */
var env = typeof runtimeConfiguration.environment === "undefined" ? "prod" : runtimeConfiguration.environment;
/** @type {boolean} */
var debug = (typeof runtimeConfiguration.debug === "undefined" ? "off" : runtimeConfiguration.debug) === "on" && env !== "prod";

document.write("Hello world!<br>spa / " + version);
