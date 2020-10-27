# frozen_string_literal: true

require 'simplecov'
require 'log_parser'
SimpleCov.start

RSpec.describe LogParser do
  describe '#initialize' do
    it 'initializes when log is given as an argument' do
      file_path = 'log'
      log_parser = LogParser.new(file_path)
      expect(log_parser).to respond_to :read_file
    end
  end
  describe '#read_file' do
    file_path = "data/webserver_sample.log"
    log_parser = LogParser.new(file_path)
    it 'returns one array of 8 rows (8 subarrays) when it reads the file in CSV format' do
      expected_output = [['/help_page/1 126.318.035.038'], ['/contact 184.123.665.067'], ['/home 184.123.665.067'],\
                         ['/about/2 444.701.448.104'], ['/help_page/1 929.398.951.889'], ['/index 444.701.448.104'],\
                         ['/help_page/1 722.247.931.582'], ['/about 061.945.150.735'], ['/help_page/1 646.865.545.408']]
      expect(log_parser.read_file).to eq(expected_output)
    end
  end
end
