# frozen_string_literal: true

# LogParsr class
class LogParser
  def initialize(file_path)
    @file_path = file_path
  end

  def read_file
    p @file_path
  end
end

LogParser.new(ARGV[0]).read_file if $PROGRAM_NAME == __FILE__ # if this is the main file being used...
# LogParser.new().read_file
