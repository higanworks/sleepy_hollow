require "bundler"
require "optparse"

Bundler.setup

require 'sinatra'
require "eventmachine"

opt = OptionParser.new

opt.on('-p =[listening port]', '--port') { |port| $port = port.to_i }
opt.parse(ARGV)

$port ||= 5228

puts "running on #{$port}"

set :port, $port
EM.threadpool_size = 300

get "/" do
  sleep params[:wait].to_i
  "wait #{params[:wait]}"
end
