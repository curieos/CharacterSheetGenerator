require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'rdoc/task'

RDoc::Task.new do |rdoc|
  rdoc.main = "README.md"
  rdoc.rdoc_dir = "doc"
  rdoc.rdoc_files.include("README.md", "lib/")
end

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
