require 'rubygems'
require 'bundler'
Bundler.require(:default)

Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

use Rack::Coffee, root: 'public', urls: '/javascript'

require './site'
require './lib/stats'

run Sinatra::Application
