require 'appium_lib'
require 'cucumber'
require 'allure-cucumber'
require 'allure-ruby-commons'
require 'rspec'
require_relative 'server'


include Allure

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
    printPageSourceOnFindFailure: true
  },
  appium_lib: {
    server_url: "http://localhost:#{ENV['PORT']}/wd/hub"
  }
}

Allure.configure do |config|
  config.environment_properties = {
    test: "testing"
  }
  config.environment = ENV["ENVIRONMENT"]
  config.results_directory = "reports/allure-results"
  config.clean_results_directory = true
end

$driver = Appium::Driver.new(appium_caps,true)

server = Server.new(server_options)
server.start_appium
server.wait_to_boot

at_exit do
  server.kill_appium
  server.kill_chrome_driver
end
