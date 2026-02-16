#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'json'

# Method to make an HTTP POST request
# Parameters:
#   url - the URL to send the POST request to
#   body_params - hash of parameters to include in the request body
def post_request(url, body_params = {})
  begin
    # Parse the URL
    uri = URI.parse(url)
    
    # Create HTTP client
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = (uri.scheme == 'https')
    
    # Create POST request
    request = Net::HTTP::Post.new(uri.path)
    request['Content-Type'] = 'application/json'
    
    # Add body parameters if provided
    request.body = body_params.to_json unless body_params.empty?
    
    # Send the request
    response = http.request(request)
    
    # Print response status
    puts "Response status: #{response.code} #{response.message}"
    
    # Print response body
    puts 'Response body:'
    
    # Parse and print JSON response in compact form
    begin
      parsed_body = JSON.parse(response.body)
      if parsed_body.empty?
        puts '{}'
      else
        puts JSON.pretty_generate(parsed_body)
      end
    rescue
      # If response is not valid JSON, print as is
      puts response.body
    end
    
  rescue StandardError => e
    puts "Error: #{e.message}"
  end
end
