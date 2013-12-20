#\ -s puma
require 'bundler'
Bundler.require(:default)

Dotenv.load

require './app'
run HashCode
