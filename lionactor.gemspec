# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lionactor/version'

Gem::Specification.new do |spec|
  spec.name          = "lionactor"
  spec.version       = Lionactor::VERSION
  spec.authors       = ["Sean Redmond"]
  spec.email         = ["github-smr@sneakemail.com"]
  spec.description   = %q{Wrapper for NYPL info API}
  spec.summary       = %q{Wrapper for NYPL info API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
