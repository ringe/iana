#!/usr/bin/env ruby

# ethertypes.rb
# yesmar@speakeasy.net

require 'pathname'
dir = Pathname.new(File.expand_path(__FILE__)).realpath
require File.join(File.dirname(dir.to_s), '../lib/iana')

SCRIPT = File.basename(__FILE__)

def known_ethertype?(ethertype)

  IANA_ETHERTYPES.include?(ethertype)
end

if ARGV.length == 1
  begin
    IANA_ETHERTYPES, IANA_ETHERTYPES_UPDATED = IANA::EtherType::load(ARGV[0])
  rescue
    puts "#{SCRIPT}: #{$!}"
    exit 1
  end
else
  puts "Usage: #{SCRIPT} <ethernet-numbers>"
  exit 1
end

puts "updated #{IANA_ETHERTYPES_UPDATED} => #{IANA_ETHERTYPES.size} entries"
puts
IANA_ETHERTYPES.each do |t|
  print "#{t.begin}"
  print "-#{t.end}" if t.end != t.begin
  puts " => #{t.description}"
end
puts

# known in :begin => true
puts "86dd is known? => #{IANA::EtherType.known?("86dd")}"

# known in :end => true
puts "8a97 is known? => #{IANA::EtherType.known?("8a97")}"

# known between :begin and :end => true
puts "8709 is known? => #{IANA::EtherType.known?("8709")}"

# unknown => false
puts "fefe is known? => #{IANA::EtherType.known?("fefe")}"

exit 0
