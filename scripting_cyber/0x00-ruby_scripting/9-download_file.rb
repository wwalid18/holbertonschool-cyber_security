#!/usr/bin/env ruby

require 'open-uri'
require 'uri'
require 'fileutils'

# Check if both arguments are provided
if ARGV.length != 2
  puts 'Usage: 9-download_file.rb URL LOCAL_FILE_PATH'
  exit 1
end

url = ARGV[0]
local_path = ARGV[1]

begin
  puts "Downloading file from #{url}..."
  
  # Open the URL and read the content
  URI.open(url) do |file|
    # Ensure the directory exists
    FileUtils.mkdir_p(File.dirname(local_path)) if local_path.include?('/')
    
    # Write the content to the local file
    File.open(local_path, 'wb') do |output|
      output.write(file.read)
    end
  end
  
  puts "File downloaded and saved to #{local_path}."
  
rescue OpenURI::HTTPError => e
  puts "HTTP Error: #{e.message}"
  exit 1
rescue URI::InvalidURIError => e
  puts "Invalid URL: #{e.message}"
  exit 1
rescue StandardError => e
  puts "Error: #{e.message}"
  exit 1
end
