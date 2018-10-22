module.exports = {
  'welcome message test': function (browser) {
    browser
      .url(browser.launchUrl)
      .assert.containsText('body', 'Hello world!')
      .end();
  }
};
