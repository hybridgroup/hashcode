#!/usr/bin/env rake

require 'bundler'
Bundler.require(:default)

%w(models lib).each do |directory|
  Dir["#{File.dirname(__FILE__)}/#{directory}/*.rb"].each do |file|
    require file
  end
end

DataMapper.setup(:default, ENV["DATABASE_URL"])
DataMapper.auto_upgrade!

Twitter.configure do |config|
  config.consumer_key = ENV["CODE2012_CONSUMER_KEY"]
  config.consumer_secret = ENV["CODE2012_CONSUMER_SECRET"]
  config.oauth_token = ENV["CODE2012_OAUTH_TOKEN"]
  config.oauth_token_secret =ENV[ "CODE2012_OAUTH_TOKEN_SECRET"]
end

task :default => :save_tweets

task :save_tweets do
  TweetSaver.new.save
end
