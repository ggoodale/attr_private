require 'rake'

Gem::Specification.new do |s|
  s.name = "attr_private"
  s.version = "0.1.0"
  s.summary = "attr_private provides a way of making fields on an " <<
              "ActiveRecord model inaccessible to users of that model."
  s.test_files = "spec/spec_suite.rb"
  s.description = s.summary
 
  s.files = FileList['[A-Z]*', '*.rb', 'lib/*.rb', 'spec/**/*.rb']
  s.require_path = 'lib'
 
  s.has_rdoc = true
  s.extra_rdoc_files = [ "README.rdoc", "CHANGES" ]
  s.rdoc_options = ["--main", "README.rdoc", "--inline-source", "--line-numbers"]
  # this should depend on activerecord, but gem install insists on installing 
  # the latest activesupport for some reason.
  # s.add_dependency("activerecord", ">= 2.1.0")
 
  s.test_files = Dir.glob('spec/*_spec.rb')
  s.require_path = 'lib'
  s.author = "Grant Goodale"
  s.email = "grant@reqall.com"
  s.homepage = "http://reqall.com"
end
