#!/usr/bin/env ruby
# vim: expandtab tabstop=2 softtabstop=2 shiftwidth=2

# examples/ports.rb
# coding:utf-8

require 'pathname'
dir = Pathname.new(File.expand_path(__FILE__)).realpath
require File.join(File.dirname(dir.to_s), '../lib/iana')

SCRIPT = File.basename(__FILE__)

if ARGV.length == 1
  begin
    IANA_PORT, IANA_PORT_UPDATED = IANA::Port::load(ARGV[0])
  rescue
    puts "#{SCRIPT}: #{$!}"
    exit 1
  end
else
  puts "Usage: #{SCRIPT} <port-numbers>"
  exit 1
end

puts "#{IANA_PORT_UPDATED} => #{IANA_PORT.size} entries"

# lookup port 22
port = 22
result = IANA_PORT[port]
puts "#{result.size} matches for port #{port}:"
result.each do |p|
  puts "=> #{p.keyword} #{port}/#{p.protocol} \"#{p.description}\""
end

exit 0
