require 'rubygems'
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

Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

use Rack::Coffee, root: 'public', urls: '/javascript'

require './site'
require './lib/stats'

run Sinatra::Application
