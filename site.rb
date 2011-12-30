require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'

require File.expand_path(File.dirname(__FILE__) + "/lib/stats")

get "/" do
  #@feeds ||= BlogFeed.get.first(5)
  haml :'index.html'
end

get '/application.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :application
end


