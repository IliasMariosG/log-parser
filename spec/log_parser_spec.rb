# frozen_string_literal: true

require 'simplecov'
require 'log_parser'
SimpleCov.start

describe LogParser do
  describe '#initialize' do
    it 'initializes when log is given as an argument' do
      file_path = 'log'
      log_parser = LogParser.new(file_path)
      expect(log_parser).to respond_to :read_file
    end
  end
end
