#!/usr/bin/env ruby
require 'twitter'

# Acquire these from https://apps.twitter.com/
CONSUMER_KEY        = ""
CONSUMER_SECRET     = ""
ACCESS_TOKEN        = ""
ACCESS_TOKEN_SECRET = ""

file = ARGV[0]

if file.nil? or !File.file? file
	puts "Valid input file required"
	exit 1
end

# Get the first line from the file
lines = File.readlines(file)
tweet = lines.pop

# Error out if file is empty
if tweet.nil?
	puts "Cache empty."
	exit 1
end

# Put file back together again
File.open(file, 'w') do |f|
  f.write(lines.join(''))
end

# Tweet the thing
twitter = Twitter::REST::Client.new do |config|
  config.consumer_key        = CONSUMER_KEY
  config.consumer_secret     = CONSUMER_SECRET
  config.access_token        = ACCESS_TOKEN
  config.access_token_secret = ACCESS_TOKEN_SECRET
end

p "#{Time.now}: #{tweet}"

twitter.update(tweet)
