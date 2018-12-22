module.exports = {
  "src_folders": [
    "src/WebTests"
  ],
  "test_settings": {
    "default": {
      "selenium_host": process.env.WEBCLIENTTESTER_SELENIUM_HUB_HOST,
      "selenium_port": process.env.WEBCLIENTTESTER_SELENIUM_HUB_PORT,
      "launch_url": process.env.WEBCLIENTTESTER_TESTS_TARGET_URL,
      "request_timeout_options": {
        "timeout": 5000,
        "retry_attempts": 0
      },
      "skip_testcases_on_fail": false,
      "screenshots": {
        "enabled": true,
        "on_failure": true,
        "on_error": false,
        "path": "var/nightwatch_output/screenshots"
      },
      "desiredCapabilities": {
        "browserName": "firefox"
      }
    },
    "chrome": {
      "desiredCapabilities": {
        "browserName": "chrome"
      }
    }
  },
  "output_folder": "var/nightwatch_output"
};
