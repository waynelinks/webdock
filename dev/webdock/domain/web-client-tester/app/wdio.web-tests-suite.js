exports.config = {
  specs: [
    "./src/WebTests/**/*.test.js"
  ],
  framework: "mocha",
  reporters: ["spec"],
  runner: "local",
  hostname: process.env.TESTER_WD_HOST,
  port: parseInt(process.env.TESTER_WD_PORT),
  path: process.env.TESTER_WD_PATH,
  capabilities: [
    {
      browserName: "firefox",
      "moz:firefoxOptions": {
        args: ["-headless"]
      }
    }
  ],
  baseUrl: process.env.TESTER_TARGET_ENTRYPOINT,
  logLevel: "error"
};
