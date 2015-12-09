# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stock-research/version'

Gem::Specification.new do |spec|
  spec.authors       = ["Frank Nowinski", "Roberto Mesado"]
  spec.email         = ["nowinski.frank@gmail.com"]
  spec.description   = %q{Research stocks}
  spec.summary       = %q{Research stocks}
  spec.homepage      = "https://learn.co"

  spec.files         = `git ls-files`.split($\)
  spec.executables   = ["stock-research"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.name          = "stock-research-cli-gem"
  spec.require_paths = ["lib", "lib/stock_research"]
  spec.version       = "0.1.0"
  spec.license       = "MIT"

  # spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end