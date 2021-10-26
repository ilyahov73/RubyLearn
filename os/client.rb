require "socket"

socket = UNIXSocket.new "/tmp/socket.sock"

puts "waiting for writing"

socket.write gets

while 1 do
    puts "waiting for receive"
    puts socket.readline

    puts "waiting for writing"
    socket.write gets
end

socket.close