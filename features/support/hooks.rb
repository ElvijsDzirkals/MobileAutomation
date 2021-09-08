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
end