
require 'rake'
require 'hanami/rake_tasks'
require 'rake/testtask'
require 'flog'
require 'flog_task'

class FlogTask < Rake::TaskLib
  attr_accessor :methods_only
end

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs    << 'spec'
  t.warning = false
end

FlogTask.new do |t|
  t.verbose = true
  t.threshold = 200 # default is 200
  t.methods_only = true
  t.dirs = %w(apps lib) # Look, Ma; no tests! Run the tool manually every so often for those.
end

task default: [:test, :flog]
task spec: :test
