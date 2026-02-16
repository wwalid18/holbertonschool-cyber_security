#!/usr/bin/env ruby

# Method to print command-line arguments
def print_arguments
  if ARGV.empty?
    puts 'No arguments provided.'
  else
    ARGV.each_with_index do |arg, index|
      puts "#{index + 1}. #{arg}"
    end
  end
end
