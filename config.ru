#\ -s puma
require 'bundler'
Bundler.require(:default)

require './lib/config.rb'

require './app'
run HashCode
