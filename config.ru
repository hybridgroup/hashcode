#\ -s puma
require 'bundler'
Bundler.require(:default)

DataMapper.setup(:default, ENV["DATABASE_URL"])

directories = %w(models lib)

directories.each do |directory|
  Dir["#{File.dirname(__FILE__)}/#{directory}/*.rb"].each do |file|
    require file
  end
end

DataMapper.auto_upgrade!

Twitter.configure do |config|
  config.consumer_key = ENV["CODE2012_CONSUMER_KEY"]
  config.consumer_secret = ENV["CODE2012_CONSUMER_SECRET"]
  config.oauth_token = ENV["CODE2012_OAUTH_TOKEN"]
  config.oauth_token_secret =ENV[ "CODE2012_OAUTH_TOKEN_SECRET"]
end

Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

use Rack::Coffee, root: 'public', urls: '/javascript'

require './site'
require './lib/stats'

run Sinatra::Application
