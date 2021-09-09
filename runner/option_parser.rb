require 'optparse'
require 'pp'
require 'ostruct'

# Used to add arguments to ruby main.rb and set values as environment variables for the test.
class OptParser

  def self.parse(args)
    options = OpenStruct.new
    options.environment = "prod"

    opt_parser = OptionParser.new do |opts|
      opts.banner = 'Usage: ruby main.rb [options]'
      opts.separator ''
      opts.separator 'Specific options:'

      opts.on('-e', '--environment [prod/staging]', 'Environment to run the test at. Default: prod ') do |environment|
        options.environment = environment
      end

      opts.separator ''
      opts.separator 'Common options:'

      opts.on_tail('-h', '--help', 'Show this message') do
        puts opts
        exit
      end

    end
    opt_parser.parse!(args)
    options
  end
end