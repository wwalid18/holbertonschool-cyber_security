#!/usr/bin/env ruby
require 'net/http'
require 'uri'
require 'json'

def post_request(url, body_params = {})
  uri = URI(url)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = uri.scheme == 'https'

  request = Net::HTTP::Post.new(uri.path, { 'Content-Type' => 'application/json' })
  request.body = body_params.to_json unless body_params.empty?

  response = http.request(request)

  puts "Response status: #{response.code} #{response.message}"
  puts "Response body:"

  begin
    json_body = JSON.parse(response.body)

    # Custom pretty print: one key per line, no indentation
    puts "{"
    json_body.each_with_index do |(k, v), i|
      comma = i == json_body.size - 1 ? "" : ","
      if v.is_a?(String)
        puts %("#{k}": "#{v}"#{comma})
      else
        puts %("#{k}": #{v}#{comma})
      end
    end
    puts "}"
  rescue JSON::ParserError
    puts response.body
  end
end
