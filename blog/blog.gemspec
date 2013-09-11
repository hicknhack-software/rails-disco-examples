$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "blog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "blog"
  s.version     = Blog::VERSION
  s.authors     = ["Robert Kranz"]
  s.email       = ["robert.kranz@hicknhack-software.com"]
  s.homepage    = "http://www.hicknhack.com"
  s.summary     = "Summary of Blog."
  s.description = "Description of Blog."

  s.files = Dir["{app,config,db,lib}/**/*"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  #s.add_dependency 'drails-cep', '0.0.1'

  s.add_development_dependency "sqlite3"
end
