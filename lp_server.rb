require "bundler"
Bundler.setup

require 'sinatra'

EM.threadpool_size = 300

get "/" do
  sleep params[:wait].to_i
  "wait #{params[:wait]}"
end
