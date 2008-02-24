#!/usr/bin/env ruby

# port.rb
# yesmsar@speakeasy.net

module IANA
  module Port
    Port = Struct.new('PORT', :keyword, :protocol, :description)

    # load IANA ports list from flat file:
    # http://www.iana.org/assignments/port-numbers
    def self.load(pathname)
      raise ArgumentError, 'nil pathname' if pathname.nil?
      raise ArgumentError, 'invalid pathname class' if pathname.class != String
      raise ArgumentError, 'empty pathname' if pathname.empty?

      ports = {}
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

          # skip commented lines
          next if line =~ /^#/

          # skip lines which do not contain the /{proto} pattern
          if line !~ /\/tcp/ && line !~ /\/udp/ && line !~ /\/sctp/ && \
            line !~ /\/dccp/
              next
          end

          line.strip!
          tokens = line.split(/[\s\t]+/)

          # if first token is a port/proto pair then the port is unnamed
          if tokens[0] =~ /\//
            name = nil
            num,proto = tokens[0].split(/\//)
            tokens.delete_at(0)
          else
            name = tokens[0]
            num,proto = tokens[1].split(/\//)
            2.times { tokens.delete_at(0) }
          end

          # remainder of tokens serves as the description
          desc = tokens.join(' ')

          p = Port.new(name, proto, desc)

          if ports[num.to_i].nil?
            ports[num.to_i] = p
          else
            c = []
            c << ports[num.to_i]
            c << p
            ports[num.to_i] = c.flatten
          end
        end
      ensure
        f.close if !f.nil?
      end

      return ports, updated
    end
  end
end

raise RuntimeError, 'This library is for require only' if $0 == __FILE__
