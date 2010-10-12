#!/usr/bin/env ruby

# tld.rb
# yesmar@gmail.com

module IANA
  module TLD
    # load IANA TLD list from flat file:
    # http://data.iana.org/TLD/tlds-alpha-by-domain.txt
    def self.load(pathname)
      raise ArgumentError, 'nil pathname' if pathname.nil?
      raise ArgumentError, 'invalid pathname class' if pathname.class != String
      raise ArgumentError, 'empty pathname' if pathname.empty?

      # TODO: better error checking for files with incorrect content

      tlds = []
      updated = nil

      begin
        f = File.new(pathname, 'r')
        while (line = f.gets)
          line.chomp!
    
          if line =~ /^# Version \d{10}, Last Updated ([\w\W\d\s]*)$/
            # extract update stamp
            updated = $1
            version,gunk= line.split(',')
            version.sub!(/^# /, '')
            updated.strip!
          else
            tlds << line.downcase!
          end
        end
      ensure
        f.close if !f.nil?
      end

      return tlds, updated, version
    end

    # is specified domain name a TLD?
    def self.tld?(dn)
      raise ArgumentError, 'nil dn' if dn.nil?
      raise ArgumentError, 'invalid dn class' if dn.class != String
      raise ArgumentError, 'empty dn' if dn.empty?

      return IANA_TLD.include?(dn) ? true : false
    end
  end
end

raise RuntimeError, 'This library is for require only' if $0 == __FILE__
