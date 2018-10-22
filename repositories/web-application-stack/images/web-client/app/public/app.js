var xhr = new XMLHttpRequest();
xhr.open("GET", "/config.json", false);
xhr.send();

if (xhr.status !== 200) {
  throw new Error('Missing runtime configuration.');
}
var runtimeConfiguration = JSON.parse(xhr.responseText);

/** @param {string} version */
var version = typeof runtimeConfiguration.version === "undefined" ? "undefined" : runtimeConfiguration.version;
/** @param {string} env */
var env = typeof runtimeConfiguration.environment === "undefined" ? "prod" : runtimeConfiguration.environment;
/** @param {boolean} debug */
var debug = (typeof runtimeConfiguration.debug === "undefined" ? "off" : runtimeConfiguration.debug) === "on" && env !== "prod";

document.write("Hello world!<br>spa / " + version);
