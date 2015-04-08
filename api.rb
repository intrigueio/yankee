require 'rubygems'
require 'sinatra'
require 'json'

class Yankee < Sinatra::Base

  helpers do
    def h(text)
      Rack::Utils.escape_html(text)
    end
  end

  $yankee_dir = File.dirname(__FILE__)

  set :env, :production
  set :bind, "0.0.0.0"
  set :port, 8888
  set :static, true                             # set up static file routing
  set :views, "#{$yankee_dir}/views"
  set :public_folder, File.expand_path(File.expand_path(".")) # set up the static dir (with images/js/css inside)

  #set :views,  File.expand_path('../views', __FILE__) # set up the views dir
  #set :haml, { :format => :html5 }                    # if you use haml

  before do
    #raise "XXX - SECURITY - You should set an API key!"
    #error 401 unless params[:key] =~ /^WHATEVER/
  end

  get '/' do
    sort = params["sort"]

    if sort == "Modified"
      @entries = Dir.entries('.').sort_by{ |x| File.mtime(x) }.reverse
    else
      @entries = Dir.entries('.').sort_by{ |x| File.size(x) }.reverse
    end

    erb :index
  end

  get '/:filename/log' do
    @x = JSON.parse(File.open("#{params[:filename]}").read)
   erb :log
  end

end
