#!/opt/puppetlabs/puppet/bin/ruby

require 'open3'

rd, wr = IO.pipe

child = fork do
  $stdin.reopen('/dev/null')
  $stdout.reopen('/dev/null')
  $stderr.reopen('/dev/null')
  rd.close
  res = -1
  Open3.popen2e('/usr/bin/wormhole', 'send', '--hide-progress', ENV['PT_filename']) do |i, o, th|
    done = false
    while line = o.gets
      if !done && line =~ /^Wormhole code is: (.*)$/
        wr.puts $1
        wr.close
        done = true
      end
    end
    res = th.value
  end
  exit
end

wr.close
Process.detach(child)

puts %[{"wormhole-code": "#{rd.gets.chomp}" }]
rd.close
