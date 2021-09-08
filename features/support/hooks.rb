Before do
  $selenium_driver = $driver.start_driver
  $selenium_driver.get("https://lv.sportsdirect.com")
  @screens = Screens.new
end

After do
    $driver.quit_driver
end