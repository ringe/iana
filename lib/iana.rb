#!/usr/bin/env ruby
# encoding: UTF-8
# vim: expandtab tabstop=2 softtabstop=2 shiftwidth=2

# lib/iana.rb

module IANA
  NAME = 'iana'
  MAJOR_VERSION = 1
  MINOR_VERSION = 1
  PATCHLEVEL = 0
  LIBPATH = File.expand_path(File.dirname(__FILE__)) + File::SEPARATOR
  PATH = File.dirname(LIBPATH) + File::SEPARATOR
  COPYRIGHT = 'Copyright 2008-2011, Ramsey Dow. All rights reserved.'

  # Returns proper library name.
  def self.name
    NAME.capitalize
  end # name

  # Returns library version.
  def self.version
    "#{MAJOR_VERSION}.#{MINOR_VERSION}.#{PATCHLEVEL}"
  end # version

  # Returns library path, adding additional elements if supplied.
  def self.libpath(*args)
    args.empty? ? LIBPATH : ::File.join(LIBPATH, args.flatten)
  end # libpath

  # Returns path, adding additional elements if supplied.
  def self.path(*args)
    args.empty? ? PATH : ::File.join(PATH, args.flatten)
  end # path
end # IANA

$LOAD_PATH.unshift(File.dirname(__FILE__)+"/#{IANA::NAME}")

#require 'consumer'
require 'ethertype'
require 'port'
require 'protocol'
require 'tld'

# TODO implement consumer model
# TODO complete documentaion
# TODO implement unit tests
# TODO lookup needs to be more flexible

raise RuntimeError, 'This library is for require only' if $0 == __FILE__
