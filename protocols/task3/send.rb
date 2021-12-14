#!/usr/bin/env ruby
require "bunny"

connection = Bunny.new
connection.start

channel = connection.create_channel
queue = channel.queue('hello')

loop do
	message = gets
	channel.default_exchange.publish(message, routing_key: queue.name)
	puts " [x] Sent #{message}"
end

connection.close
