$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "has_mock_objects/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "has_mock_objects"
  s.version     = HasMockObjects::VERSION
  s.authors     = ["Carl Anderson"]
  s.email       = ["carl@planetargon.com"]
  s.homepage    = "https://github.com/nextekcarl/has_mock_objects"
  s.summary     = "Makes putting off decisions for related objects as easy as using Lorem Ipsum text in mockups."
  s.description = "After reading Practical Object-Oriented Design in Ruby: An Agile Primer by Sandi Metz, I wanted an easy way to put off making decisions about related objects during the early phases of a project. This is what I came up with for that."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.markdown"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency 'faker', '~>1.2'

  s.add_development_dependency "sqlite3"
end
