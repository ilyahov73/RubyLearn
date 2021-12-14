#!/usr/bin/env ruby
require "bunny"

connection = Bunny.new
connection.start

channel = connection.create_channel
queue = channel.queue('hello')
puts ' [*] Waiting for messages. To exit press CTRL+C'
loop do
  	queue.subscribe(block: true) do |_delivery_info, _properties, body|
    	puts " [x] Received #{body}"
    	end 	
end

