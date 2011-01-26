#!/usr/bin/env ruby
# vim: expandtab tabstop=2 softtabstop=2 shiftwidth=2

# examples/protocols.rb
# coding:utf-8

require 'pathname'
dir = Pathname.new(File.expand_path(__FILE__)).realpath
require File.join(File.dirname(dir.to_s), '../lib/iana')

SCRIPT = File.basename(__FILE__)

if ARGV.length == 1
  begin
    IANA_PROTO, IANA_PROTO_UPDATED = IANA::Protocol::load(ARGV[0])
  rescue
    puts "#{SCRIPT}: #{$!}"
    exit 1
  end
else
  puts "Usage: #{SCRIPT} <protocol-numbers>"
  exit 1
end

puts "#{IANA_PROTO_UPDATED} => #{IANA_PROTO.size} entries"

# lookup protocol 50
result = IANA_PROTO[50]
puts "protocol 50 => #{result.keyword} \"#{result.description}\" " \
  "#{result.references}"

exit 0
