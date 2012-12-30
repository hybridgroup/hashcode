require 'rubygems'
require 'sinatra'
require 'haml'
require 'twitter'

# load main
load File.join(File.dirname(__FILE__), 'site.rb')

run Sinatra::Application
