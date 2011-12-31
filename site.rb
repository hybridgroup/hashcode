require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'gchart'

require File.expand_path(File.dirname(__FILE__) + "/lib/stats")

get "/" do
  @stats = Stats.get_totals
  haml :'index.html'
end

get '/application.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :application
end


