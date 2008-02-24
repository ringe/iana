#!/usr/bin/env ruby

# iana.rb
# yesmar@speakeasy.net

$KCODE = 'UTF8'
require 'jcode'

module IANA
  IANA::NAME = 'iana'
  IANA::VERSION = '0.0.4'
  IANA::COPYRIGHT = 'Copyright (c) 2008 Ramsey Dow'
  def self.copyright() IANA::COPYRIGHT end
  def self.version() IANA::VERSION end
  def self.libdir() File.expand_path(__FILE__).gsub(%r/\.rb$/, '') end
end

$LOAD_PATH.unshift(File.dirname(__FILE__)+'/iana')

require 'port'
require 'protocol'
require 'tld'

raise RuntimeError, 'This library is for require only' if $0 == __FILE__
