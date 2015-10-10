# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aub/payroll/version'

Gem::Specification.new do |spec|
  spec.name          = "aub-payroll"
  spec.version       = AUB::Payroll::VERSION
  spec.authors       = ["Ronald Maravilla"]
  spec.email         = ["rmaravilla@payrollhero.com"]

  spec.summary       = %q{An AUB Payroll File Generator.}
  spec.description   = %q{An AUB Payroll File Generator.}
  spec.homepage      = "https://github.com/payrollhero/aub-payroll"
  spec.license       = "BSD-3-Clause"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"

  spec.add_dependency "activesupport"
  spec.add_dependency "activemodel"
end
