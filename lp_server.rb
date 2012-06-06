require "bundler"
Bundler.setup

require 'sinatra'
require "eventmachine"

set :port, 8080
EM.threadpool_size = 300

get "/" do
  sleep params[:wait].to_i
  "wait #{params[:wait]}"
end
