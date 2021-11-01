require "socket"

File.delete('socket.sock') if File.exists? 'socket.sock'
server = UNIXServer.new 'socket.sock'

puts "Connection accepting..."

socket = server.accept

loop do
    puts "waiting for receive"
    puts socket.readline

    puts "waiting for writing"
    socket.write gets
end

socket.close