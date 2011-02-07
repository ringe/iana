#!/usr/bin/env ruby
# encoding: UTF-8
# vim: expandtab tabstop=2 softtabstop=2 shiftwidth=2

# lib/iana/protocol.rb

# rubygems
require 'nokogiri'

module IANA
  module Protocol
    Protocol = Struct.new('PROTOCOL', :name, :description, :references)

    # load IANA protocols list from XML file:
    # http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xml
    def self.load(pathname)
      raise ArgumentError, 'nil pathname' if pathname.nil?
      raise ArgumentError, 'invalid pathname class' if pathname.class != String
      raise ArgumentError, 'empty pathname' if pathname.empty?

      protocols = {}
      updated = nil

      begin
        f = File.new(pathname, 'r')
        doc = Nokogiri::XML(f)
        updated = doc.css('registry/updated').text
        doc.css('registry/registry/record').each do |r|
          # range
          value = r.css('value').text
          if value =~ /-/ then
            low,high = value.split('-').map(&:to_i)
          else
            low = value.to_i
            high = low
          end

          # name
          name = r.css('name').text
          name = nil if !name.nil? && name.empty?

          # description
          description = r.css('description').text
          description = nil if !description.nil? && description.empty?

          # references
          xref = []
          r.css('xref').each do |x|
            data = x['data']
            xref << data if !data.nil? && !data.empty?
          end

          if low == high then
            protocols[low] = Protocol.new(name, description, xref)
          else
            # create an entry for each range element
            (high-low+1).times do |i|
              protocols[low+i] = Protocol.new(name, description, xref)
            end
          end
        end
      ensure
        f.close if !f.nil?
      end

      return protocols, updated
    end
  end
end

raise RuntimeError, 'This library is for require only' if $0 == __FILE__
