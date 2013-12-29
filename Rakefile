#!/usr/bin/env rake

require 'bundler'
Bundler.require(:default)
require 'cgi'
require 'net/http'

%w(models lib).each do |directory|
  Dir["#{File.dirname(__FILE__)}/#{directory}/*.rb"].each do |file|
    require file
  end
end

DataMapper.setup(:default, ENV["DATABASE_URL"])
DataMapper.auto_upgrade!

Twitter.configure do |config|
  config.consumer_key       = ENV["HASHCODE_CONSUMER_KEY"]
  config.consumer_secret    = ENV["HASHCODE_CONSUMER_SECRET"]
  config.oauth_token        = ENV["HASHCODE_OAUTH_TOKEN"]
  config.oauth_token_secret = ENV["HASHCODE_OAUTH_TOKEN_SECRET"]
end

task :default => :save_tweets

task :save_tweets do
  TweetSaver.new.save
end

task :backlog do
  (1..15).each do |page|
    url = "http://search.twitter.com/search.json?q=%23code2012&rpp=100&result_type=recent"
    url += "&page=#{page}"

    response = JSON.parse(Net::HTTP.get(URI(url)))

    response["results"].each do |tweet|
      SavedTweet.create(
        :tweet_id   => tweet["id"],
        :attrs      => tweet,
        :created_at => tweet["created_at"]
      )
    end

    sleep(0.25)
  end
end
