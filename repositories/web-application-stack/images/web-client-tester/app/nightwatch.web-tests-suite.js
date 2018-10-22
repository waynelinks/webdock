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
      "selenium_host": process.env.WEBCLIENTTESTER_SELENIUM_CHROME_DRIVER_HOST,
      "selenium_port": process.env.WEBCLIENTTESTER_SELENIUM_CHROME_DRIVER_PORT,
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
      "selenium_host": process.env.WEBCLIENTTESTER_SELENIUM_FIREFOX_DRIVER_HOST,
      "selenium_port": process.env.WEBCLIENTTESTER_SELENIUM_FIREFOX_DRIVER_PORT,
      "desiredCapabilities": {
        "browserName": "firefox"
      }
    }
  }
};
