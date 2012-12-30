require 'rubygems'
require 'bundler'
Bundler.require(:default)

require './site'
require './lib/stats'

run Sinatra::Application
