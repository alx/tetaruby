require 'appengine-rack'
AppEngine::Rack.configure_app(
  :application => 'tetaruby',
  :version => 1)
require 'guestbook'
run Sinatra::Application
