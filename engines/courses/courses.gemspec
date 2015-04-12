$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "courses/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "courses"
  s.version     = Courses::VERSION
  s.authors     = ["Sung Won Cho"]
  s.email       = ["mikeswcho@gmail.com"]
  s.summary     = "Courses, enrollments, etc."
  s.description = "Courses, enrollments, etc."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib,spec/factories}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
end
