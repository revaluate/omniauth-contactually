require 'bundler/setup'
require 'omniauth-contactually'
require './app.rb'

use Rack::Session::Cookie, :secret => 'abc123'

use OmniAuth::Builder do
  provider :contactually, ENV['CONTACTUALLY_APP_ID'], ENV['CONTACTUALLY_APP_SECRET'], :scope => 'all:manage'
end

run Sinatra::Application
