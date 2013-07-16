require "bundler/gem_tasks"

require 'rake/testtask'

Rake::TestTask.new do |t|
    t.libs << 'lib/form_robot'
    t.test_files = FileList['test/lib/form_robot/*_test.rb']
    t.verbose = true
end

task :default => :test
