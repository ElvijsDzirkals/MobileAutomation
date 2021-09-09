require 'optparse'
require 'pp'
require 'ostruct'

# Defines the option parser for running a test.
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