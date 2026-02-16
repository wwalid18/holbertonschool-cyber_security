#!/usr/bin/env ruby

def print_arguments
  if ARGV.empty?
    puts 'No arguments provided.'
    return
  end

  puts "Arguments:\n"
  ARGV.each do |arg|
    puts arg
  end
end
