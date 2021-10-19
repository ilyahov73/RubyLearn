require 'socket'
socket1, socket2 = UNIXSocket.pair

parentpid = Process.pid

player1 = fork do
	Signal.trap :USR1 do
		num = socket1.recv(10).to_i
		$stdout.syswrite("player1 get num = #{num}\n")
		num+= rand(3)
		socket1.send num.to_s, 0
		$stdout.syswrite("player1 send num = #{num}\n")
		if num < 30
			Process.kill :USR2, parentpid
		else
			socket1.close
		end

	end 
	num = 0
	socket1.send num.to_s, 0
	Process.kill :USR2, parentpid
	$stdout.syswrite("player1 send num = #{num}\n")
	sleep 3
end


Signal.trap :USR2 do
	num = socket2.recv(10).to_i
	$stdout.syswrite("player2 get num = #{num}\n")
	num+= rand(3)
	socket2.send num.to_s, 0
	$stdout.syswrite("player2 send num = #{num}\n")
	if num < 30
		Process.kill :USR1, player1
	else
		socket2.close
	end	

end 

Process.wait