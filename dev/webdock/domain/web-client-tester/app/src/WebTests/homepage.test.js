const expect = require("expect");

describe("homepage", () => {
  it("should have the right title", async function () {
    browser.url('/');

    let title = await browser.getTitle();
    expect(title).toBe("Web client app");
  });

  it("should have the right welcome message", async function () {
    browser.url('/');

    let container = await browser.$("body p");
    let text = await container.getText();
    expect(text).toBe("Hello world!");
  });
});
