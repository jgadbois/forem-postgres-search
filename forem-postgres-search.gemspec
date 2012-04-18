$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "forem-postgres-search/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "forem-postgres-search"
  s.version     = ForemPostgresSearch::VERSION
  s.authors     = ["John Gadbois"]
  s.summary     = "Postgres Full Text Search for Forem"
  s.description = "Postgres Full Text Search for Forem"

  s.files = Dir["{app,config,db,lib}/**/*", "app/**/forem/*.rb"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "forem"
  s.add_dependency "pg_search"
  s.add_dependency "pg"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
end
