#!/usr/bin/env ruby
# encoding: UTF-8
# vim: expandtab tabstop=2 softtabstop=2 shiftwidth=2

# examples/tlds.rb

require 'pathname'
dir = Pathname.new(File.expand_path(__FILE__)).realpath
require File.join(File.dirname(dir.to_s), '../lib/iana')

SCRIPT = File.basename(__FILE__)

if ARGV.length == 1
  begin
    IANA_TLD, IANA_TLD_UPDATED, IANA_TLD_VERSION = IANA::TLD::load(ARGV[0])
  rescue
    puts "#{SCRIPT}: #{$!}"
    exit 1
  end
else
  puts "Usage: #{SCRIPT} <tlds>"
  exit 1
end

puts "#{IANA_TLD_VERSION} updated #{IANA_TLD_UPDATED} => " \
  "#{IANA_TLD.size} entries"

# is com a TLD?
puts "com is a TLD? => #{IANA::TLD.tld?('com')}"

# how about to?
puts "to is a TLD? => #{IANA::TLD.tld?('to')}"

# grizzlebat is probably not a TLD
puts "grizzlebat is a TLD? => #{IANA::TLD.tld?('grizzlebat')}"

# how about yn?
puts "yn is a TLD? => #{IANA::TLD.tld?('yn')}"

exit 0
