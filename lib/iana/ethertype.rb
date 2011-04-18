#!/usr/bin/env ruby
# encoding: UTF-8
# vim: expandtab tabstop=2 softtabstop=2 shiftwidth=2

# lib/iana/ethertype.rb

module IANA
  module EtherType
    EtherType = Struct.new('ETHERTYPE', :begin, :end, :description)

    # I hate doing it this way, but the inconsistency of IANA data files...
    LAST_ENTRY = '^ 65535   FFFF        -      -     Reserved               \[RFC1701\]$'

    # load IANA Ether types list from flat file:
    # http://www.iana.org/assignments/ethernet-numbers
    def self.load(pathname)
      raise ArgumentError, 'nil pathname' if pathname.nil?
      raise ArgumentError, 'invalid pathname class' if pathname.class != String
      raise ArgumentError, 'empty pathname' if pathname.empty?

      # TODO: better error checking for files with incorrect content

      ethertypes = []
      updated = nil

      begin
        f = File.new(pathname, 'r')
        while (line = f.gets)
          line.chomp!

          # extract update stamp
          if line =~ /^\(last updated (\d{4}-\d{2}-\d{2})\)\s*$/
            updated = $1
            next
          end

          # skip lines that don't have [XXX] or (XXX) at the end
          next if line !~ /\[\w*\]$/ && line !~ /\([\w\s]*\)$/

          # now skip all lines that don't begin with a space
          next if line !~ /^[\t\ ]*/

          # skip over decimal Ethertype
          pos = 0
          if line =~ /^\t\ /
            pos = 2
          else
            pos = 9
          end

          # clean up ridiculous IANA formatting
          line.gsub!(/^\t/, '8') # TODO: investigate this weirdness
          line.gsub!(/\t     -/, '        -')
          line.gsub!(/\t\t\t  /, '                     ')
          line.gsub!(/\t/, '   ')

          tmp = line[pos..-1]

          ethertype = tmp[0..9].strip!
          low, high = ethertype.split('-')
          high = low if high.nil?

          description, *junk = tmp[25..-1].split('[')
          description.strip!

          et = EtherType.new(low, high, description)
          ethertypes << et

          # short-circuit as soon as we've hit the end of the list
          break if line =~ /#{LAST_ENTRY}/
        end
      ensure
        f.close if !f.nil?
      end

      return ethertypes, updated
    end

    # is specified Ether type known
    def self.known?(ethertype)
      raise ArgumentError, 'nil ethertype' if ethertype.nil?
      raise ArgumentError, 'invalid ethertype class' if \
        ethertype.class != String
      raise ArgumentError, 'empty ethertype' if ethertype.empty?

      IANA_ETHERTYPES.each do |t|
        return true if ethertype.upcase == t.begin
        if t.end != t.begin
          return true if ethertype.upcase >= t.begin && \
            ethertype.upcase <= t.end
        end
      end

      false
    end
  end
end

raise RuntimeError, 'This library is for require only' if $0 == __FILE__
