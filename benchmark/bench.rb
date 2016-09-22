duration = '30s'

[1,2,4,8,16,32,64,128, 256].each do |concurrency|
	system "wrk -c#{concurrency} -t#{concurrency} -d#{duration} -s ./post.lua http://95.85.2.125:3000/benchmark/cpu_and_io"
end
