require 'benchmark'

array_common_adding = []
array_thread_adding = []

Benchmark.bm do |x|
    x.report('common adding') {100000.times {array_common_adding.push(1)}}
    x.report('thread adding') {100000.times {Thread.new {array_thread_adding.push(1)}}}
end

