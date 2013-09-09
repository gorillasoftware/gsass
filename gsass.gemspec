# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gsass/version'

Gem::Specification.new do |spec|
  spec.name          = "gsass"
  spec.version       = Gsass::VERSION
  spec.platform         = Gem::Platform::RUBY
  spec.authors       = ["Sebastian de Castelberg"]
  spec.email         = ["sebu@kpricorn.org"]
  spec.description   = %q{gorilla software sass mixins}
  spec.summary       = %q{gorilla software sass mixins}
  spec.homepage      = "https://github.com/gorillasoftware/gsass"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency('sass', '>= 3.2.0')
  spec.add_dependency('thor')

  spec.add_development_dependency('aruba', '~> 0.4')
  spec.add_development_dependency('rake')

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
