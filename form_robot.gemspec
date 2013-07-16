# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'form_robot/version'

Gem::Specification.new do |spec|
  spec.name          = "form_robot"
  spec.version       = FormRobot::VERSION
  spec.authors       = ["Keith Broughton"]
  spec.email         = ["keithbro256@gmail.com"]
  spec.description   = %q{The Form Robot gem accepts a list of instructions to perform against a collection of URLs and HTML forms.}
  spec.summary       = %q{The Form Robot gem accepts a list of instructions to perform against a collection of URLs and HTML forms.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency 'mechanize'
end
