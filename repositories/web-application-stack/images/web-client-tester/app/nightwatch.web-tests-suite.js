module.exports = {
  "src_folders": [
    "src/WebTests"
  ],
  "output_folder": "var/nightwatch_output",
  "selenium": {
    "start_process": false,
    "start_session": true
  },
  "test_settings": {
    "default": {
      "launch_url": process.env.WEBCLIENTTESTER_TESTS_TARGET_URL,
      "selenium_host": process.env.WEBCLIENTTESTER_SELENIUM_HUB_HOST,
      "selenium_port": process.env.WEBCLIENTTESTER_SELENIUM_HUB_PORT,
      "request_timeout_options": {
        "timeout": 5000,
        "retry_attempts": 3
      },
      "silent": true,
      "screenshots": {
        "enabled": true,
        "on_failure": true,
        "on_error": false,
        "path": "var/nightwatch_output/screenshots"
      },
      "desiredCapabilities": {
        "browserName": "chrome"
      },
      "skip_testcases_on_fail": false
    },
    "firefox": {
      "desiredCapabilities": {
        "browserName": "firefox",
        "marionette": true
      }
    }
  }
};
