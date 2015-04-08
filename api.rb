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

  path = "."
  port = 8888

  set :env, :production
  set :bind, "0.0.0.0"
  set :port, port
  set :static, true                             # set up static file routing
  set :views, "#{$yankee_dir}/views"
  set :public_folder, File.expand_path(path) # set up the static dir (with images/js/css inside)

  before do
    #raise "XXX - SECURITY - You should set an API key!"
    #error 401 unless params[:key] =~ /^WHATEVER/
  end

  get '/' do
    sort = params["sort"]

    # Grab all files, minus hidden files
    files = Dir.entries(path).reject{|entry| entry =~ /^\..*$/}

    if sort == "Modified"
      @entries = files.sort_by{ |x| File.mtime(x) }.reverse
    elsif sort == "Size"
      @entries = files.sort_by{ |x| File.size(x) }.reverse
    #elsif sort == "Name"
    #  @entries = files.sort_by{ |x| x }
    else
      @entries = files.sort_by{ |x| x }
    end

    erb :index
  end

  get '/:filename/log' do

    if params[:filename] =~ /.json/
      @x = JSON.parse(File.open("#{params[:filename]}").read)
      erb :log
    else
      "Unable to open this file type"
    end

  end

end
