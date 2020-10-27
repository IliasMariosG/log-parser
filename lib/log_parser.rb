#!/usr/bin/env ruby
# frozen_string_literal: true

require 'csv'

# LogParser class
class LogParser
  attr_reader :collection, :formatted_message_string

  def initialize(file_path)
    @file_path = file_path
  end

  # It reads the file and returns an array of rows
  def read_file
    CSV.read(@file_path)
  end

  def parse_most_visits
    collection = {}
    CSV.foreach(@file_path) do |row|
      page_ip = row.first # e.g. first row "/help_page/1 126.318.035.038"
      page = page_ip.split(' ').first # e.g. "/help_page/1"
      ip = page_ip.split(' ').last
      collection.key?(page) ? collection[page] << ip : collection[page] = [ip]
    end
    collection # hash
  end

  def descending_order(collection)
    page_visits = collection.each { |page, ip| collection[page] = ip.size }
    page_visits.sort_by { |_, ip| ip }.reverse # array
  end

  def format_message(collection)
    formatted_message = []
    collection.each do |page|
      formatted_message << (page[1] > 1 ? "#{page[0]} #{page[1]} visits" : "#{page[0]} #{page[1]} visit")
    end
    p formatted_message.join(', ')
  end
end

if $PROGRAM_NAME == __FILE__ # if this is the main file being used...
  LogParser.new(ARGV[0]).format_message([['/help_page/1', 4], ['/about', 1], ['/index', 1], ['/about/2', 1],\
                                         ['/home', 1], ['/contact', 1]])
end
