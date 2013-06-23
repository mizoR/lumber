# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lumber/version'

Gem::Specification.new do |gem|
  gem.name          = "lumber"
  gem.version       = Lumber::VERSION
  gem.authors       = ["mizoryu"]
  gem.email         = ["suzunatsu@yahoo.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency "feed-normalizer"

  gem.add_development_dependency "pry"
  gem.add_development_dependency "rspec"
end
