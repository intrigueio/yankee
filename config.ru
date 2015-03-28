require_relative 'api'

run Rack::URLMap.new('/' => Sinatra::Application)
