Gem::Specification.new do |s|
  s.name = "attr_private"
  s.version = "0.1.1"
  s.summary = "attr_private provides a way of making fields on an " <<
              "ActiveRecord model inaccessible to users of that model."
  s.test_files = "spec/spec_suite.rb"
  s.description = s.summary
 
  s.files = %w(CHANGES Rakefile README.rdoc lib/attr_private.rb spec/environment_fixture_setup.rb spec/spec.opts spec/spec_helper.rb spec/spec_suite.rb spec/attr_private/attr_private_spec.rb)
  s.require_path = 'lib'
 
  s.has_rdoc = true
  s.extra_rdoc_files = [ "README.rdoc", "CHANGES" ]
  s.rdoc_options = ["--main", "README.rdoc", "--inline-source", "--line-numbers"]
  # this should depend on activerecord, but gem install insists on installing 
  # the latest activesupport for some reason.
  # s.add_dependency("activerecord", ">= 2.1.0")
 
  s.test_files = %w(spec/attr_private/attr_private_spec.rb)
  s.author = "Grant Goodale"
  s.email = "grant@reqall.com"
  s.homepage = "http://reqall.com"
end
