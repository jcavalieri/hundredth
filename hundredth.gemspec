# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hundredth/version'

Gem::Specification.new do |spec|
  spec.name          = 'hundredth'
  spec.version       = VERSION
  spec.authors       = ['John Cavalieri']
  spec.email         = ['john.cavalieri@gmail.com']
  spec.summary       = 'writes out ordinal numbers'
  spec.description   = <<~DESC
    Writes out 1 to 100 their full ordinal words. 101 and greater are are written out using the number
    followed by the ordinal indicator, e.g. 'st', 'nd', 'rd'.

    For example:
    1 = first
    2 = second
    100 = hundredth
    101 = 101st
  DESC
  spec.homepage      = 'http://github.com/jcavalieri/hundredth'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*']

  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'i18n', '~> 1.1'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'minitest', '~> 5.5', '>= 5.5.1'
  spec.add_development_dependency 'rake', '~> 0'
  spec.add_development_dependency 'rubocop', '~> 0.58.2'
end
