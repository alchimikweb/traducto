Gem::Specification.new do |gem|
  gem.name        = "traducto"
  gem.description = "Rails helpers collection to simplify the localization code."
  gem.summary     = "Rails helpers collection to simplify the localization code."
  gem.homepage    = "https://github.com/alchimikweb/traducto"
  gem.version     = "1.0.7"
  gem.licenses    = ["MIT"]

  gem.authors     = ["Sebastien Rosa"]
  gem.email       = ["srosa@alchimik.com"]

  gem.files       = `git ls-files`.split($\)
  gem.executables = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files  = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "rails", ['~> 5.0']
  gem.add_development_dependency "sqlite3", "~> 1.3"
  gem.add_development_dependency "rspec-rails", "~> 3.7"
  gem.add_development_dependency "simplecov", "~> 0.15"
  gem.add_development_dependency "simplecov-rcov-text", "~> 0"
  gem.add_development_dependency "coveralls", "~> 0.8"
end
