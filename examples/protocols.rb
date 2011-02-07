#!/usr/bin/env ruby
# encoding: UTF-8
# vim: expandtab tabstop=2 softtabstop=2 shiftwidth=2

# examples/protocols.rb

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

# lookup protocol 22
result = IANA_PROTO[22]
print "protocol 22 => #{result.name} \"#{result.description}\""
if !result.references.nil? && !result.references.empty? then
  puts " #{result.references}"
else
  puts
end

exit 0
