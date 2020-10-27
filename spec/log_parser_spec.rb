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
    file_path = 'data/webserver_sample.log'
    log_parser = LogParser.new(file_path)
    it 'returns one array of 8 rows (8 subarrays) when it reads the file in CSV format' do
      expected_output = [['/help_page/1 126.318.035.038'], ['/contact 184.123.665.067'], ['/home 184.123.665.067'],\
                         ['/about/2 444.701.448.104'], ['/help_page/1 929.398.951.889'], ['/index 444.701.448.104'],\
                         ['/help_page/1 722.247.931.582'], ['/about 061.945.150.735'], ['/help_page/1 646.865.545.408']]
      expect(log_parser.read_file).to eq(expected_output)
    end
  end
  describe '#parse_most_visits' do
    file_path = 'data/webserver_sample.log'
    log_parser = LogParser.new(file_path)
    it 'returns a hash, each value being an array for each row in ascending order' do
      expected_output = { '/help_page/1' =>
                          ['126.318.035.038', '929.398.951.889', '722.247.931.582', '646.865.545.408'],\
                          '/contact' => ['184.123.665.067'], '/home' => ['184.123.665.067'],\
                          '/about/2' => ['444.701.448.104'],\
                          '/index' => ['444.701.448.104'], '/about' => ['061.945.150.735'] }
      expect(log_parser.parse_most_visits).to eq(expected_output)
    end
  end
  describe '#descending_order' do
    file_path = 'data/webserver_sample.log'
    log_parser = LogParser.new(file_path)
    it 'returns an  array in descending order for all domains' do
      input = { '/help_page/1' => ['126.318.035.038', '929.398.951.889', '722.247.931.582', '646.865.545.408'],\
                '/contact' => ['184.123.665.067'],
                '/home' => ['184.123.665.067'],
                '/about/2' => ['444.701.448.104'],\
                '/index' => ['444.701.448.104'],
                '/about' => ['061.945.150.735'] }
      expected_output = [['/help_page/1', 4],\
                         ['/about', 1],\
                         ['/index', 1],\
                         ['/about/2', 1],\
                         ['/home', 1],\
                         ['/contact', 1]]
      expect(log_parser.descending_order(input)).to eq(expected_output)
    end
  end
end
