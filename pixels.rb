require 'rubygems'
require 'sinatra'
require 'dm-core'

# Configure DataMapper to use the App Engine datastore 
DataMapper.setup(:default, "appengine://auto")

# Create your model class
class Pixel
  include DataMapper::Resource
  
  property :id, Integer, :key => true
  property :status, Text
end

# Initialize pixel array if none exists
if Pixel.first.nil?
  p "Initialize pixel array"
  status = ['on', 'off']
  2500.times do |i|
    Pixel.create(:id => i, :status => status[rand(2)])
  end
end

get '/' do
  # Just list all the shouts
  @pixels = Pixel.all
  erb :index
end

post '/pixel_on' do
  Pixel.first(:id => params[:pixel_id]).update :status => 'on'
end

post '/pixel_off' do
  Pixel.first(:id => params[:pixel_id]).update :status => 'off'
end