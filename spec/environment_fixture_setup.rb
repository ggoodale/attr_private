require "rubygems"
require "spec"
dir = File.dirname(__FILE__)
$LOAD_PATH.unshift "#{dir}/../lib"
require "attr_private"
require "pp"
gem "activerecord", ">= 2.1.0"