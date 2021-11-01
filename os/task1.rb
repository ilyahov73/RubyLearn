child = fork do
  Signal.trap :USR1 do
    $stdout.syswrite("Hello world!\n")
  end 
end


Process.kill :USR1, child

Signal.trap :CHLD do
  $stdout.syswrite("Bye")
end

Process.wait(child)