file_name = ARGV[0]
logs = File.read(file_name)

entries = logs.split(/Running \S+ test @ /)
entries.shift

entries.each do |entry|
    lines = entry.lines
    url = lines.shift
    threads = 0
    avg_latency = 0
    requests_number = 0
    errors_number = 0
    avg_req_sec = 0
    
    lines.each do |line|
      line.strip!
      case line
      when /^\d+ threads/
        threads = line.split(' ',2).first
      when /^Latency/
        avg_latency = line.split(/\s+/)[1]
      when /^\d+ requests/
        requests_number = line.split(/\s+/)[0].to_i
      when /^Non/
        errors_number = line.split(/\s+/)[4].to_i
      when /^Req\/Sec/
        avg_req_sec = line.strip.split(/\s+/)[1]
      end
    end

    puts [threads, avg_latency, avg_req_sec, requests_number - errors_number].join(', ')
end
