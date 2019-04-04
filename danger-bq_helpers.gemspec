# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bq_helpers/gem_version.rb'

Gem::Specification.new do |spec|
  spec.name          = 'danger-bq_helpers'
  spec.version       = BqHelpers::VERSION
  spec.authors       = ['Sebastián Varela']
  spec.email         = ['sebastian.varela@masmovil.com']
  spec.description   = %q{Set of helpers to easily validate your repos using Danger}
  spec.summary       = %q{Set of helpers to easily validate your repos using Danger}
  spec.homepage      = 'https://github.com/bq/danger-bq_helpers'
  spec.license       = 'APACHE 2.0'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'danger-plugin-api', '~> 1.0'

  # General ruby development
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 10.0'

  # Testing support
  spec.add_development_dependency 'rspec', '~> 3.4'

  # Linting code and docs
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "yard"

  # Makes testing easy via `bundle exec guard`
  spec.add_development_dependency 'guard', '~> 2.14'
  spec.add_development_dependency 'guard-rspec', '~> 4.7'

  # If you want to work on older builds of ruby
  spec.add_development_dependency 'listen', '3.0.7'

  # This gives you the chance to run a REPL inside your tests
  # via:
  #
  #    require 'pry'
  #    binding.pry
  #
  # This will stop test execution and let you inspect the results
  spec.add_development_dependency 'pry'
end
