#!/usr/bin/env ruby

# protocol.rb
# yesmar@speakeasy.net

module IANA
  module Protocol
    Protocol = Struct.new('PROTOCOL', :keyword, :description, :references)

    # load IANA protocols list from flat file:
    # http://www.iana.org/assignments/protocol-numbers
    def self.load(pathname)
      raise ArgumentError, 'nil pathname' if pathname.nil?
      raise ArgumentError, 'invalid pathname class' if pathname.class != String
      raise ArgumentError, 'empty pathname' if pathname.empty?

      protocols = {}
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

          # match spaces d[dd][-ddd] spaces
          if line =~ /^\s+\d{1,3}([\-]{1}\d{3})?\s+/
            line.strip!
            line.gsub!(/\t/, ' ')
            line.gsub!(/\s{2,}/, '|')
            data = line.split('|')
            raw_decimal = data[0]

            if raw_decimal =~ /\-/
              first,second = raw_decimal.split(' ')
              raw_low,raw_high = first.split('-')
              low = raw_low.to_i
              high = raw_high.to_i
              low.upto(high) do |i|
                p = Protocol.new
                p.keyword = '<unassigned>'
                p.description = '<unassigned>'
                p.references = '[IANA]'
                protocols[i] = p
              end
            else
              p = Protocol.new
              decimal = raw_decimal.to_i
              case data.size
                when 3
                  p.keyword = nil
                  p.description = data[1]
                  p.references = data[2]
                else
                  p.keyword = data[1]
                  p.description = data[2]
                  p.references = data[3]
              end
              protocols[decimal] = p
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
