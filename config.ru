require 'appengine-rack'
AppEngine::Rack.configure_app(
  :application => 'tetaruby',
  :version => 2)
require 'pixels'
run Sinatra::Application
