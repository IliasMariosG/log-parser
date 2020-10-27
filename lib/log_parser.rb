
# frozen_string_literal: true
require 'csv'

# LogParsr class
class LogParser
  def initialize(file_path)
    @file_path = file_path
  end

  # It reads the file and returns an array of rows
  def read_file
    CSV.read(@file_path)
  end
end

LogParser.new(ARGV[0]).read_file if $PROGRAM_NAME == __FILE__ # if this is the main file being used...

# LogParser.new('data/webserver_sample_1_page.log').read_file
# LogParser.new('data/webserver_sample_2_pages.log').read_file
