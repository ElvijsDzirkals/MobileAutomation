class Server

  def start_appium
    kill_chrome_driver
    kill_appium
    command = "appium"
    Thread.new do
      `#{command}`
    end
  end

  def kill_appium
    lines = `ps ax | grep appium | grep node`.split("\n")
    lines.each do |line|
      pid = line.split(' ').first
      `kill -9 #{pid}`
    end
  end

  def kill_chrome_driver
    lines = `ps ax | grep chromedriver`.split("\n")
    lines.each do |line|
      pid = line.split(' ').first
      `kill -9 #{pid}`
    end
  end

  def wait_to_boot
    opened = false
    opened = `nmap -p 4723 localhost | grep 4723`.include?('open') until opened
  end

end