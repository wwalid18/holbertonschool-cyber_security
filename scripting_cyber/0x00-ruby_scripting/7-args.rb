#!/usr/bin/env ruby

# Method to print command-line arguments
def print_arguments
  if ARGV.empty?
    puts 'No arguments provided.'
  else
    puts 'Arguments:'
    puts
    ARGV.each_with_index do |arg, index|
      if index == ARGV.length - 1
        print "#{index + 1}. #{arg}"
      else
        puts "#{index + 1}. #{arg}"
      end
    end
  end
end
