#!/opt/puppetlabs/puppet/bin/ruby

require 'open3'

wormhole = if File.executable?('/usr/bin/wormhole')
             '/usr/bin/wormhole'
           elsif File.executable?('/usr/local/bin/wormhole')
             '/usr/local/bin/wormhole'
           else
             raise 'wormhole not found'
           end

rd, wr = IO.pipe

child = fork do
  $stdin.reopen('/dev/null')
  $stdout.reopen('/dev/null')
  $stderr.reopen('/dev/null')
  rd.close
  res = -1
  Open3.popen2e(wormhole, 'send', '--hide-progress', ENV['PT_filename']) do |_i, o, th|
    done = false
    while !done && (line = o.gets)
      next unless line =~ /^Wormhole code is: (.*)$/

      wr.puts Regexp.last_match(1)
      wr.close
      done = true
    end
    res = th.value
  end
  exit
end

wr.close
Process.detach(child)

puts %({"code": "#{rd.gets.chomp}" })
rd.close
