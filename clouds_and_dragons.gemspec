# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clouds_and_dragons/version'

Gem::Specification.new do |spec|
  spec.name          = "clouds_and_dragons"
  spec.version       = CloudsAndDragons::VERSION
  spec.authors       = ["Douglas Thrift"]
  spec.email         = ["douglas.thrift@rightscale.com"]
  spec.summary       = %q{Command line tool for RightScale}
  spec.description   = %q{Clouds and Dragons is a command line tool for RightScale}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "right_api_objects"
  spec.add_dependency "trollop", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
