require "bundler"
require "benchmark"
require "optparse"

Bundler.setup

require "em-websocket"

@clients = []

opt = OptionParser.new

opt.on('-p =[listening port]', '--port') { |port| $port = port.to_i }
opt.parse(ARGV)

$port ||= 8080

puts "running on #{$port}"
EM::WebSocket.start(host: "0.0.0.0", port: $port) do |ws|
  ws.onopen do
    @clients << ws
    p "open with: #{@clients.size}"
  end

  ws.onmessage do |message|
    puts "on message: #{message}."

    wait_time = message.to_i

    timer = EM::Timer.new(wait_time) do
      ws.send("wait: #{wait_time}s")
      timer.cancel
    end

    puts "complete send message."
  end

  ws.onclose do
    @clients.delete(ws)
  end

  ws.onerror do
    p "err"
  end
end

