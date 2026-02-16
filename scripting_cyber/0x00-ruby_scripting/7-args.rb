#!/usr/bin/env ruby

# Method to print command-line arguments
def print_arguments
  if ARGV.empty?
    puts 'No arguments provided.'
  else
    puts 'Arguments:'
    ARGV.each do |arg|
      puts arg
    end
  end
end
