require 'appium_lib'
require_relative 'server'

opts = {
  caps: {
    deviceName: 'Samsung note',
    automationName: 'UiAutomator2',
    platformName: 'Android',
    udid: 'RF8N205TNHZ',
    browserName: 'Chrome',
    chromedriverPort: "7000",
    systemPort: "8201"
  },
  appium_lib: {
    server_url: 'http://localhost:4723/wd/hub'
  }
}

$driver = Appium::Driver.new(opts,true)
server = Server.new
server.start_appium
server.wait_to_boot

at_exit do
  server.kill_appium
  server.kill_chrome_driver
end
