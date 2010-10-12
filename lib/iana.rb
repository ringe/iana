#!/usr/bin/env ruby

# iana.rb
# yesmar@gmail.com

module IANA
  IANA::NAME = 'iana'
  IANA::VERSION = '0.0.8'
  IANA::COPYRIGHT = 'Copyright (c) 2008, 2009, 2010 Ramsey Dow'
  def self.copyright() IANA::COPYRIGHT end
  def self.version() IANA::VERSION end
  def self.libdir() File.expand_path(__FILE__).gsub(%r/\.rb$/, '') end
end

$LOAD_PATH.unshift(File.dirname(__FILE__)+'/iana')

require 'ethertype'
require 'port'
require 'protocol'
require 'tld'

# TODO: bad developer, no unit tests
# TODO: lookup needs to be more flexible

raise RuntimeError, 'This library is for require only' if $0 == __FILE__
