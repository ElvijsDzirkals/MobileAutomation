Before do
  $selenium_driver = $driver.start_driver
  #To showcase the use of option parser , ENVIRONMENT variable could be used to change the link to visit
  p "Running tests on #{ENV['ENVIRONMENT']}"
  $selenium_driver.get("https://lv.sportsdirect.com")
  @screens = Screens.new
end

After do
  Allure.lifecycle.update_test_case do |test_case|
    test_case.history_id = "#{test_case.history_id}#{ENV['UDID']}"
    test_case.parameters.push(Parameter.new("Device", ENV['DEVICE_NAME']))
  end
  $driver.quit_driver
end

After do |scenario|
  if scenario.failed?
    example_number = 1
    if scenario.name.include?('Examples (#')
      example_number = scenario.name.scan(/\(#(.*?)\)/).last.first
    end
    screenshot_dir = "reports/screenshots/#{ENV['device_name']}_#{scenario.name}-#{example_number}.png"
    Allure.add_attachment(name: "Page source", type: String::new, source: $driver.get_source)
    get_screenshot(screenshot_dir)
    Allure.add_attachment(name: 'Screenshot', type: 'image/png', source: File.open(screenshot_dir))
  end
end

def get_screenshot(screenshot_dir)
  $driver.screenshot(screenshot_dir)
  attach(screenshot_dir, 'image/png')
end
