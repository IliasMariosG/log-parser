#!/usr/bin/env ruby
# frozen_string_literal: true

require 'csv'

# LogParser class
class LogParser
  attr_reader :collection

  def initialize(file_path)
    @file_path = file_path
  end

  # It reads the file and returns an array of rows
  def read_file
    CSV.read(@file_path)
  end

  def parse_most_visits
    file_read = read_file
    file_read.each_with_object({}) do |row, hash_collection|
      page_ip = row.first # e.g. first row "/help_page/1 126.318.035.038"
      page = page_ip.split(' ').first # e.g. "/help_page/1"
      ip = page_ip.split(' ').last
      hash_collection.key?(page) ? hash_collection[page] << ip : hash_collection[page] = [ip]
    end
  end

  def descending_order
    collection = parse_most_visits
    page_visits = collection.each { |page, ip| collection[page] = ip.size }
    page_visits.sort_by { |_, ip| ip }.reverse # array
  end

  def format_message
    collection = descending_order
    collection.each_with_object([]) do |page, formatted_message|
      formatted_message << (page[1] > 1 ? "#{page[0]} #{page[1]} visits" : "#{page[0]} #{page[1]} visit")
    end.join(', ')
  end

  def print_file
    p format_message
  end
end

LogParser.new(ARGV[0]).print_file if $PROGRAM_NAME == __FILE__ # if this is the main file being used...

# LogParser.new('data/webserver_sample.log').read_file
# LogParser.new('data/webserver_sample.log').parse_most_visits
# LogParser.new('data/webserver_sample.log').descending_order
# LogParser.new('data/webserver_sample.log').format_message
# LogParser.new('data/webserver_sample.log').print_file
