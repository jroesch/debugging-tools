require File.expand_path('../lib/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'trap_point'
  gem.date        = '2014-08-22'
  gem.summary     = %q{Better debugging tools for Ruby}
  gem.description = %q{You can spend hours trying to find the source of an issue/bug and discovering the metadata that may help with solving the problem. It
                       would be useful to provide this information with hooks into classes, modules, requires, includes, extends, function calls, etc. These hooks
                       can be triggered and provide the user with useful metadata like what file and line number of this occurrence.}
  gem.authors     = ['Jared Roesch', 'Pete Cruz']
  gem.email       = ['roeschinc@gmail.com', 'iPetesta@gmail.com']
  gem.homepage    = 'https://github.com/jroesch/debugging-tools'
  gem.license     = 'MIT'
  gem.files       = Dir['lib/**/*']
  gem.version     = TrapPoint::VERSION

  gem.add_dependency 'colorize'
  gem.add_dependency 'activerecord'

  gem.add_development_dependency 'pry'
end
