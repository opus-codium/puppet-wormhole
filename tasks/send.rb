#!/opt/puppetlabs/puppet/bin/ruby

require 'open3'

rd, wr = IO.pipe

fork do
  res = -1
  Open3.popen2e('/usr/bin/wormhole', 'send', '--hide-progress', ENV['PT_filename']) do |i, o, th|
    done = false
    while line = o.gets
      if !done && line =~ /^Wormhole code is: (.*)$/
        wr.puts $1
        done = true
      end
    end
    res = th.value
  end
  exit
end

puts %[{"wormhole-code": "#{rd.gets}" }]
