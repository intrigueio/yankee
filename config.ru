require_relative './glance'

run Rack::URLMap.new('/' => GlanceApp)
