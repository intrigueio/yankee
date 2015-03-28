require 'rubygems'
require 'sinatra'

class Yankee < Sinatra::Base

  set :env, :production
  set :bind, 0.0.0.0
  set :port, 8888
  set :static, true                             # set up static file routing
  #set :public, File.expand_path('..', __FILE__) # set up the static dir (with images/js/css inside)

  #set :views,  File.expand_path('../views', __FILE__) # set up the views dir
  #set :haml, { :format => :html5 }                    # if you use haml

  before do
    #raise "XXX - SECURITY - You should set an API key!"
    #error 401 unless params[:key] =~ /^WHATEVER/
  end

  get '/' do

    sort = params["sort"]

    if sort == "Modified"
      entries = Dir.entries('.').sort_by { |x| File.mtime(x) }
    else
      entries = Dir.entries('.').sort_by { |x| File.size(x) }
    end

    out = []
    out << "<table>"
    out << "<tr><td>Filename</td><td><a href=/?sort=>Size</a><td><td><a href=/?sort=Modified>Modified</a><td></tr><br/>"
    entries.map do |e|
      out << "<tr><td>#{e}</td><td>#{File.size(e)}<td><td>#{File.mtime(e)}<td></tr><br/>"
    end
    out << "</table>"
  out.join("\n")
  end
end
