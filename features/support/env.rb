require 'appium_lib'
require_relative 'server'

server_options = {
    'port' => ENV['PORT'],
    'boot_port' => ENV['BOOT_PORT'],
    'udid' => ENV['UDID']
}

appium_caps = {
  caps: {
    deviceName: 'Samsung note',
    automationName: 'UiAutomator2',
    platformName: 'Android',
    udid: ENV['UDID'],
    browserName: 'Chrome',
    chromedriverPort: ENV['CHROME_PORT'],
  },
  appium_lib: {
    server_url: "http://localhost:#{ENV['PORT']}/wd/hub"
  }
}

$driver = Appium::Driver.new(appium_caps,true)

server = Server.new(server_options)
server.start_appium
server.wait_to_boot

at_exit do
  server.kill_appium
  server.kill_chrome_driver
end
