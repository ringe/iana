#!/usr/bin/env ruby

require 'rubygems'
Gem::manage_gems
require 'rake/gempackagetask'
require 'rake/testtask'

spec = Gem::Specification.new do |s|
  s.platform =   Gem::Platform::RUBY
  s.name = 'IANA'
  s.version = '0.0.4'
  s.author = 'Ramsey Dow'
  s.email = 'yesmar @nospam@ speakeasy.net'
  s.summary = 'Ruby module which process flat files from IANA'
  s.files = FileList['lib/*.rb', 'lib/iana/*.rb', 'test/*'].to_a
  s.require_path = 'lib'
  s.test_files = Dir.glob('test/*.rb')
  s.has_rdoc = true
  s.extra_rdoc_files = ['README']
end

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*.rb']
  t.verbose = true
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_tar = true
end

task :default do
  system("rake -T")
end

task :clean => :clobber_package

task :gem => "pkg/#{spec.name}-#{spec.version}.gem" do
  puts 'generated latest version'
end
