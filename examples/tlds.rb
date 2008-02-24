#!/usr/bin/env ruby

# tlds.rb
# yesmar@speakeasy.net

require 'pathname'
dir = Pathname.new(File.expand_path(__FILE__)).realpath
require File.join(File.dirname(dir.to_s), '../lib/iana')

SCRIPT = File.basename(__FILE__)

def tld?(dn)
  raise ArgumentError, 'nil dn' if dn.nil?
  raise ArgumentError, 'invalid dn class' if dn.class != String
  raise ArgumentError, 'empty dn' if dn.empty?

  return IANA_TLD.include?(dn) ? true : false
end

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
puts "com is a TLD? => #{tld?('com')}"

# how about to?
puts "to is a TLD? => #{tld?('to')}"

# grizzlebat is probably not a TLD
puts "grizzlebat is a TLD? => #{tld?('grizzlebat')}"

# how about yn?
puts "yn is a TLD? => #{tld?('yn')}"

exit 0
