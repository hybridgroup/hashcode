#\ -s puma
require 'bundler'
require 'json'
Bundler.require(:default)

require './lib/config.rb'
require './lib/stat_generator.rb'

require './app'
run HashCode
