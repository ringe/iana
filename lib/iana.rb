#!/usr/bin/env ruby

# iana.rb
# yesmar@speakeasy.net

module IANA
  IANA::NAME = 'IANA'
  IANA::VERSION = '0.0.1'
  IANA::COPYRIGHT = 'Copyright 2008, Ramsey Dow. All rights reserved.'
  def self.version() IANA::VERSION end
  def self.libdir() File.expand_path(__FILE__).gsub(%r/\.rb$/, '') end
end

$LOAD_PATH.unshift(File.dirname(__FILE__)+'/iana')

require 'port'
require 'protocol'
require 'tld'
