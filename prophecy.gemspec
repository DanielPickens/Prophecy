lib = File.expand_path("../lib", __FILE__)
$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'prophecy/version'

Gem::Specification.new do |s|
  s.name     = 'prophecy'
  s.version  = ::ProphecyCLI::VERSION
  s.authors  = ['Daniel Pickens']
  s.email    = ['daniel.pickens@gmail.com']
  s.homepage = 'http://github.com/danielpickens/prophecy'
  s.license  = 'MIT'

  s.description = s.summary = ' A Gem wrapper for Chart visualization abstraction in the Helm CLI'

  s.add_dependency 'helm-rb', '~> 0.1'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'webmock', '~> 1.24.2'
  

  s.require_path = 'lib'
  s.files = Dir['{lib,spec,vendor}/**/*', 'Gemfile', 'LICENSE', 'CHANGELOG.md', 'README.md', 'Rakefile', 'helm-cli.gemspec']
end
