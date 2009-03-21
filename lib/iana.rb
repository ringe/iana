#!/usr/bin/env ruby

# iana.rb
# yesmar@speakeasy.net

module IANA
  IANA::NAME = 'iana'
  IANA::VERSION = '0.0.7'
  IANA::COPYRIGHT = 'Copyright (c) 2008, 2009 Ramsey Dow'
  def self.copyright() IANA::COPYRIGHT end
  def self.version() IANA::VERSION end
  def self.libdir() File.expand_path(__FILE__).gsub(%r/\.rb$/, '') end
end

$LOAD_PATH.unshift(File.dirname(__FILE__)+'/iana')

require 'port'
require 'protocol'
require 'tld'
require 'lsr'

# TODO: bad developer, no unit tests
# TODO: lookup needs to be more flexible
# TODO: add IANA ethernet-numbers support

raise RuntimeError, 'This library is for require only' if $0 == __FILE__
