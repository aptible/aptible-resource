# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'English'
require 'aptible/resource/version'

Gem::Specification.new do |spec|
  spec.name          = 'aptible-resource'
  spec.version       = Aptible::Resource::VERSION
  spec.authors       = ['Frank Macreery']
  spec.email         = ['frank@macreery.com']
  spec.description   = 'Foundation classes for Aptible resource server gems'
  spec.summary       = 'Foundation classes for Aptible resource server gems'
  spec.homepage      = 'https://github.com/aptible/aptible-resource'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($RS)
  spec.test_files    = spec.files.grep(%r{^spec\/})
  spec.require_paths = ['lib']

  # HyperResource dependencies
  spec.add_dependency 'uri_template', '>= 0.5.2'
  spec.add_dependency 'json'
  spec.add_dependency 'httpclient', '~> 2.8'
  spec.add_dependency 'fridge'
  spec.add_dependency 'activesupport'
  spec.add_dependency 'gem_config', '~> 0.3.1'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'aptible-tasks'
  spec.add_development_dependency 'rake', '< 11.0'
  spec.add_development_dependency 'rspec', '~> 2.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'webmock', '~> 2.3.2'
end
