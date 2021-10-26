require "socket"

server = UNIXServer.new '/tmp/socket.sock'

puts "==== Waiting for connection"

socket = server.accept

while 1 do
    puts "waiting for receive"
    puts socket.readline

    puts "waiting for writing"
    socket.write gets
end

socket.close