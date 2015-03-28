require 'rubygems'
require 'sinatra'

before do
  #raise "XXX - SECURITY - You should set an API key!"
  #error 401 unless params[:key] =~ /^WHATEVER/
end

get '/' do
   Dir.entries('.').map { |e| "<p>#{e}</p>" }
end
