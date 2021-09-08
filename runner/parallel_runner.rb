require_relative 'adb'

    @port = 4333
    @boot_port = 5555
    @chrome_driver_port = 7000
    @threads = []

    device_list = Adb.connected_devices
    p "Connected devices: #{device_list}"
    device_list.each do |device|
      @threads << Thread.new(@port,@boot_port,@chrome_driver_port) do |port,boot_port,chrome_driver_port|
        command = "cucumber -f pretty -f html -o reports/#{Adb.device_name(device)}.html " \
        "UDID=#{device} " \
        "DEVICE_NAME=#{Adb.device_name(device)} " \
        "PORT=#{port} " \
        "BOOT_PORT=#{boot_port} " \
        "CHROME_PORT=#{chrome_driver_port}"
        p command
        `#{command}`
      end
      @port += 1
      @boot_port += 1
      @chrome_driver_port += 1
    end

@threads.each(&:join)



