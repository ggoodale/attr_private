require "rake"
require 'rake/gempackagetask'
require 'rake/clean'
require 'rake/testtask'
require 'rake/rdoctask'
 
desc "Runs the Rspec suite"
task(:default) do
  run_suite
end
 
desc "Runs the Rspec suite"
task(:spec) do
  run_suite
end
 
def run_suite
  dir = File.dirname(__FILE__)
  system("ruby #{dir}/spec/spec_suite.rb --options #{dir}/spec/spec.opts") || raise("Spec Suite failed")
end
 
spec = eval(File.read("#{File.dirname(__FILE__)}/attr_private.gemspec"))
PKG_NAME = spec.name
PKG_VERSION = spec.version
 
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_zip = true
  pkg.need_tar = true
end