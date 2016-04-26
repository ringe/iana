#!/usr/bin/env ruby
# vim: expandtab tabstop=2 softtabstop=2 shiftwidth=2

# Rakefile
# coding:utf-8

require 'rubygems'
require 'rake'
require 'yard'

require 'rake/clean'
require 'rake/testtask'

CLEAN.include('cache/*', 'Manifest', 'iana.gemspec')
CLOBBER.include('cache')

task :default do
  system("rake -T")
end

# override RDoc with YARD
desc 'generate documentation'
task :doc do
  system("yard --doc")
end

# run test suite
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*.rb']
  t.verbose = true
end
