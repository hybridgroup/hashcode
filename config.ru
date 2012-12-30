require 'rubygems'
require 'bundler'
Bundler.require(:default)

Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

require './site'
require './lib/stats'

run Sinatra::Application
