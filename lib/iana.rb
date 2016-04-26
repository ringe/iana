#!/usr/bin/env ruby
# encoding: UTF-8
# vim: expandtab tabstop=2 softtabstop=2 shiftwidth=2

# lib/iana.rb
module IANA
end # IANA

require 'open-uri'
require 'open-uri/cached'

require 'iana/port'
require 'iana/protocol'
require 'iana/tld'

raise RuntimeError, 'This library is for require only' if $0 == __FILE__
