require_relative 'adb'

class ParallelRunner

  def initialize(options)
    @options = options
  end

  def run_parallel
    @port = 4333
    @boot_port = 5555
    @chrome_driver_port = 7000
    @threads = []

    device_list = Adb.connected_devices
    if device_list.any?
      p "Connected devices: #{device_list}"

      device_list.each do |device|
        device_name = Adb.device_name(device)
        @threads << Thread.new(@port, @boot_port, @chrome_driver_port) do |port, boot_port, chrome_driver_port|
          command = "cucumber -f pretty -f html -o reports/cucumber/#{device_name}.html " \
        "--format AllureCucumber::CucumberFormatter -o reports/allure-results/#{device_name} " \
        "UDID=#{device} " \
        "DEVICE_NAME=#{device_name} " \
        "PORT=#{port} " \
        "BOOT_PORT=#{boot_port} " \
        "CHROME_PORT=#{chrome_driver_port} " \
        "ENVIRONMENT=#{@options['environment']}"
          p command
          `#{command}`
        end
        @port += 1
        @boot_port += 1
        @chrome_driver_port += 1
      end
    else
      throw "NO DEVICES CONNECTED!!!! Not running tests"
    end
  end

  def wait_for_all_threads
    @threads.each(&:join)
  end

end


