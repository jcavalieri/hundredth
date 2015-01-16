# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hundredth/version'

Gem::Specification.new do |spec|
  spec.name          = 'hundredth'
  spec.version       = VERSION
  spec.authors       = ['John Cavalieri']
  spec.email         = ['john.cavalieri@gmail.com']
  spec.summary       = 'writes out ordinal numbers'
  spec.description   = "Writes out 1 to 100 full words. 101 and greater are are written out using the number followed by the ordinal indicator, e.g. 'st', 'nd', 'rd'."
  spec.homepage      = 'http://github.com/jcavalieri/hundredth'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*']

  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'i18n', '~> 0'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake','~> 0'
  spec.add_development_dependency 'minitest', '~> 5.5', '>= 5.5.1'
end
