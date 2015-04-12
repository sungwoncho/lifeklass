$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mentors/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mentors"
  s.version     = Mentors::VERSION
  s.authors     = ["Sung Won Cho"]
  s.email       = ["mikeswcho@gmail.com"]
  s.summary     = "Mentor, organizations, etc."
  s.description = "Mentor, organizations, etc."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib,spec/factories}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
end
