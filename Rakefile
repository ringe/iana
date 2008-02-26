#!/usr/bin/env ruby

require 'rubygems'
Gem::manage_gems
require 'rake/gempackagetask'
require 'rake/testtask'

spec = Gem::Specification.new do |s|
  s.platform =   Gem::Platform::RUBY
  s.name = 'iana'
  s.version = '0.0.4'
  s.author = 'Ramsey Dow'
  s.email = 'yesmar @nospam@ speakeasy.net'
  s.summary = 'Ruby module which process flat files from IANA'
  s.rubyforge_project = 'http://rubyforge.org/projects/iana/'
  s.files = FileList['lib/*.rb', 'lib/iana/*.rb', 'test/*', 'examples/*'].to_a
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

namespace :todo do
  desc 'List TODOs in all .rb files under lib/'
  task(:list) do
      FileList["lib/**/*.rb"].egrep(/TODO/)
  end
 
  desc 'Edit all TODOs in VIM' # or your favorite editor
  task(:edit) do
      # jump to the first TODO in the first file
      cmd = 'vim +/TODO/' 
 
      filelist = []
      FileList["lib/**/*.rb"].egrep(/TODO/) { |fn,cnt,line| filelist << fn }
 
      # will fork a new process and exit, if you're using gvim
      system("#{cmd} #{filelist.sort.join(' ')}") 
  end
end
