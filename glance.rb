require 'sinatra'
require 'httparty'
require 'json'
require 'pry'

class GlanceApp < Sinatra::Base

  $glance_dir = File.dirname(__FILE__)

  set :root, "#{$glance_dir}"
  set :views, "#{$glance_dir}/views"
  set :public_folder, 'public'

  helpers do
    def h(text)
      Rack::Utils.escape_html(text)
    end
  end

  get '/' do
    #url = 'https://s3.amazonaws.com/intrigue-scans'
    #resp = HTTParty.get(url)
    #response = Crack::XML.parse(resp.body)
    dir_listing = Dir.glob("#{$glance_dir}/data/*.json")
    out = "<html><body><ul>"
    dir_listing.each{|f| out << "<li><a href='/#{h f.split("/").last}'>#{h f.split("/").last.gsub("discovery_on_", "")}</a></li>" };
    out << "</ul></body></html>"
  end

  get '/:filename' do
    filename = params["filename"]
    data = File.read "#{$glance_dir}/data/#{filename}"

    response = JSON.parse(data)
    out = "<html><body><ul>"
    response["entities"].sort_by{|x| x["type"]}.each do |e|
      if e["type"] == "Intrigue::Entity::Info"
        next
      elsif e["type"] == "Intrigue::Entity::Uri"
        out << "<li>#{h e["type"]}: <a target='_blank' href='#{h e["name"]}'>#{h e["name"]}</a></li>"
      else
        out << "<li>#{h e["type"]}: #{h e["name"]}</li>"
      end
    end
    out << "</ul></body></html>"
  end


  get '/graph/sigma' do
    erb :sigma
  end


end
