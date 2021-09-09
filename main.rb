require_relative 'runner/parallel_runner'
require_relative 'runner/option_parser'

runner = ParallelRunner.new(OptParser.parse(ARGV))
runner.run_parallel
runner.wait_for_all_threads