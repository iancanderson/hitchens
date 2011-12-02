$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "hitchens/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "hitchens"
  s.version     = Hitchens::VERSION
  s.authors     = ["Ian C. Anderson"]
  s.email       = ["ian@iancanderson.net"]
  s.homepage    = "http://www.iancanderson.net"
  s.summary     = "Blog engine for Rails 3.1+"
  s.description = "Mountable blogging engine with a focus on maintainability and good clean OO design."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.3"
  # s.add_dependency "jquery-rails"
  s.add_dependency "haml", "~> 3.1.4"
  s.add_dependency "simple_form", "~> 1.5.2"
  s.add_dependency "draper", "~> 0.9.5"
  s.add_dependency "redcarpet", "~> 1.17.2"
  s.add_dependency "cancan", "~> 1.6.7"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 2.7.0"
end
