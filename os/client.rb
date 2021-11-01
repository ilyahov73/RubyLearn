require "socket"

socket = UNIXSocket.new "socket.sock"

puts "waiting for writing"

socket.write gets

loop do
    puts "waiting for receive"
    puts socket.readline

    puts "waiting for writing"
    socket.write gets
end

socket.close