# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{iana}
  s.version = "0.0.6"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ramsey Dow"]
  s.date = %q{2009-02-09}
  s.description = %q{Ruby library which process flat files from IANA.}
  s.email = %q{yesmar@speakeasy.net}
  s.files = ['lib/iana.rb', 'lib/iana/port.rb', 'lib/iana/protocol.rb',
    'lib/iana/tld.rb', 'examples/ports.rb', 'examples/protocols.rb',
     'examples/tlds.rb']
  s.has_rdoc = true
  s.homepage = %q{http://github.com/yesmar/iana}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.extra_rdoc_files = ['README']
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Ruby library which process flat files from IANA.}
end
