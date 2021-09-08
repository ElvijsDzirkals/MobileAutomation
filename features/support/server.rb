class Server

  def initialize(options)
    @port = options['port']
    @boot_port = options['boot_port']
    @udid = options['udid']
  end

  def start_appium
    kill_chrome_driver
    kill_appium
    command = "appium -p #{@port} -bp #{@boot_port} -U #{@udid}"
    Thread.new do
      `#{command}`
    end
  end

  def kill_appium
    lines = `ps ax | grep appium #{@udid}| grep node`.split("\n")
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
    opened = `nmap -p #{@port} localhost | grep #{@port}`.include?('open') until opened
  end

end