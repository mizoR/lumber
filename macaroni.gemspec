# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'macaroni/version'

Gem::Specification.new do |gem|
  gem.name          = "macaroni"
  gem.version       = Macaroni::VERSION
  gem.authors       = ["mizoR"]
  gem.email         = ["r.mizokami@gmail.com"]
  gem.description   = %q{Macaroni is a ruby DSL for easily feed agregation and pipeline processing.}
  gem.summary       = %q{Ruby DSL for feed aggregation.}
  gem.homepage      = "https://github.com/mizoR/macaroni"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency "feed-normalizer"
  gem.add_dependency "nokogiri"

  gem.add_development_dependency "pry"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "coveralls"
end
