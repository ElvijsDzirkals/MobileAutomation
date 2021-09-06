require 'appium_lib'

opts = {
  caps: {
    deviceName: 'Samsung note',
    automationName: 'UiAutomator2',
    platformName: 'Android',
    udid: 'RF8N205TNHZ',
    browserName: 'Chrome',
  },
  appium_lib: {
    server_url: 'http://localhost:4723/wd/hub'
  }
}

$driver = Appium::Driver.new(opts,true)
$selenium_driver = $driver.start_driver

$selenium_driver.get("https://www.sportsdirect.com")
p $driver.methods
$driver.find_element(:css , '#MobtxtSearch').click