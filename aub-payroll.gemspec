# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aub/payroll/version'

Gem::Specification.new do |spec|
  spec.name          = 'aub-payroll'
  spec.version       = AUB::Payroll::VERSION
  spec.authors       = ['Ronald Maravilla']
  spec.email         = ['rmaravilla@payrollhero.com']

  spec.summary       = 'An AUB Payroll File Generator.'
  spec.description   = 'An AUB Payroll File Generator.'
  spec.homepage      = 'https://github.com/payrollhero/aub-payroll'
  spec.license       = 'BSD-3-Clause'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = ">= 2.7"

  spec.add_development_dependency 'bundler', '> 1.9'
  spec.add_development_dependency 'rake', '> 12', '< 14'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'shotgun'
  spec.add_development_dependency 'pdf_spec'
  spec.add_development_dependency 'github_changelog_generator'

  spec.add_dependency 'activesupport', '> 6.0'
  spec.add_dependency 'activemodel', '> 6.0'
  spec.add_dependency 'pdfkit'
  spec.add_dependency 'ph_model'
  spec.add_dependency 'tilt'
  spec.add_dependency 'slim'
  spec.add_dependency 'sass'
  spec.add_dependency 'configurations', '~> 2.2.0'
end
