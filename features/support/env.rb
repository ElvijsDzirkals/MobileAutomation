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

Before do
  $selenium_driver = $driver.start_driver
  $selenium_driver.get("https://lv.sportsdirect.com")
  @screens = Screens.new
end

After do |scenario|
  if scenario.failed?
    add_screenshot(scenario.name)
    p "Scenario failed:#{scenario.name}"
  else
    p "Scenario passed:#{scenario.name}"
    $driver.quit_driver
  end

  def add_screenshot(scenario_name)
    scenario_name.tr!(" ", "_")
    screenshot_dir = "reports/#{scenario_name}.jpeg"
    $driver.screenshot(screenshot_dir)
    attach(screenshot_dir, 'image/jpeg')
  end

end