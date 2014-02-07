Gem::Specification.new do |s|
s.name        = 'hundredth'
s.version     = '0.0.2'
s.date        = '2014-01-16'
s.summary     = 'writes out ordinal numbers'
s.description = "Writes out 1 to 100 full words. 101 and greater are are written out using the number followed by the ordinal indicator, e.g. 'st', 'nd', 'rd'."
s.authors     = ['John Cavalieri', 'Rosie Hoyem']
s.email       = 'jcavalieri@fastpencil.com'
s.files       = Dir['lib/**/*']
s.homepage    = 'http://github.com/jcavalieri/hundredth'
s.license     = 'MIT'
s.add_runtime_dependency 'i18n', '~> 0'
end
