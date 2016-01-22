$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "gallery/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "gallery"
  s.version     = Gallery::VERSION
  s.authors     = ["mazharoddin mohammed"]
  s.email       = ["mazharoddin@gmail.com"]
  s.homepage    = ""
  s.summary     = ": Summary of Gallery."
  s.description = ": Description of Gallery."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5"

  s.add_development_dependency "sqlite3"
end
