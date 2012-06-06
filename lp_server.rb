require "bundler"
Bundler.setup

require 'sinatra'

get "/" do
  sleep params[:wait].to_i
  "wait #{params[:wait]}"
end
