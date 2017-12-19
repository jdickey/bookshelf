
require 'rake'
require 'hanami/rake_tasks'
require 'rake/testtask'
require 'flay'
require 'flay_task'
require 'flog'
require 'flog_task'
require 'reek/rake/task'

class FlogTask < Rake::TaskLib
  attr_accessor :methods_only
end

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs    << 'spec'
  t.warning = false
end

FlayTask.new do |t|
  t.verbose = true
  t.dirs = %w(apps lib)
end

FlogTask.new do |t|
  t.verbose = true
  t.threshold = 200 # default is 200
  t.methods_only = true
  t.dirs = %w(apps lib) # Look, Ma; no tests! Run the tool manually every so often for those.
end

Reek::Rake::Task.new do |t|
  t.config_file = 'config.reek'
  t.source_files = '{apps,lib}/**/*.rb'
  t.reek_opts = '--sort-by smelliness --no-progress  -s'
end

task default: [:test, :flog, :flay]
task spec: :test
