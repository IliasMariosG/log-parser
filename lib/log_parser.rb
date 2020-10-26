class LogParser
  
  def initialize(file_path)
    @file_path = file_path
  end

  def read_file
    p @file_path
  end

end

if $PROGRAM_NAME == __FILE__
  LogParser.new(ARGV[0]).read_file
end 
#LogParser.new().read_file