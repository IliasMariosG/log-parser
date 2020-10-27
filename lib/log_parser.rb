#!/usr/bin/env ruby
# frozen_string_literal: true
require 'csv'

# LogParser class
class LogParser
  def initialize(file_path)
    @file_path = file_path
  end

  # It reads the file and returns an array of rows
  
  def print_file
    read_file
    parse_most_visits
  end

  def read_file
    CSV.read(@file_path)
  end

  def parse_most_visits
    #  @file.join(' ')
    collection = {}
      CSV.foreach(@file_path) do |row|
        page_ip = row.first # e.g. first row "/help_page/1 126.318.035.038"
        page = page_ip.split(' ').first # e.g. "/help_page/1"
        ip = page_ip.split(' ').last
        if collection.key?(page) 
          collection[page] << ip
        else
          collection[page] = [ip]
        end
    end
    collection # hash
  end
end

LogParser.new(ARGV[0]).print_file if $PROGRAM_NAME == __FILE__ # if this is the main file being used...

# LogParser.new('data/webserver_sample_1_page.log').read_file
# LogParser.new('data/webserver_sample_2_pages.log').read_file
