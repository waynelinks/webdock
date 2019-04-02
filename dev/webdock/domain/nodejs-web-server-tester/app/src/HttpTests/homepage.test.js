let request = require("sync-request");

/** @type {string} */
let testsTargetEntrypoint = process.env.TESTER_TARGET_ENTRYPOINT;

test("welcome message test", () => {
  let response = request("GET", testsTargetEntrypoint);

  expect(response.statusCode).toBe(200);
  expect(response.headers["content-type"]).toBe("application/json");
  let payload = JSON.parse(response.body);
  expect(payload.message).toBe('Hello world!');
});
