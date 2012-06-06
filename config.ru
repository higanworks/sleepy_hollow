$:.unshift(File.expand_path("..", __FILE__))
require "lp_server.rb"

run Sinatra::Application
