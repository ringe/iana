#!/usr/bin/env ruby

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*.rb']
  t.verbose = true
end

task :default do
  system("rake -T")
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
