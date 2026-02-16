#!/usr/bin/env ruby

require 'digest'

# Check if both arguments are provided
if ARGV.length != 2
  puts 'Usage: 10-password_cracked.rb HASHED_PASSWORD DICTIONARY_FILE'
  exit 1
end

hashed_password = ARGV[0].strip.downcase
dictionary_file = ARGV[1]

begin
  # Check if dictionary file exists
  unless File.exist?(dictionary_file)
    puts "Error: Dictionary file '#{dictionary_file}' not found."
    exit 1
  end
  
  # Read dictionary file and attempt to crack the password
  found = false
  
  File.foreach(dictionary_file) do |line|
    # Remove newline and any whitespace
    word = line.strip
    
    # Skip empty lines
    next if word.empty?
    
    # Hash the word using SHA-256
    hash = Digest::SHA256.hexdigest(word)
    
    # Compare with the target hash
    if hash == hashed_password
      puts "Password found: #{word}"
      found = true
      break
    end
  end
  
  puts 'Password not found in dictionary.' unless found
  
rescue Errno::ENOENT => e
  puts "Error: Could not read dictionary file - #{e.message}"
  exit 1
rescue StandardError => e
  puts "Error: #{e.message}"
  exit 1
end
