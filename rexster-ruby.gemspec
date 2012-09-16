# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rexster-ruby/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nikhil Lanjewar"]
  gem.email         = ["nikhil@lanjewar.com"]
  gem.description   = %q{Ruby gem for interfacing apps with Rexster}
  gem.summary       = %q{This gem, vastly inspired by Max De Marzi's Neography, can talk to a Rexster server over REST }
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rexster-ruby"
  gem.require_paths = ["lib"]
  gem.version       = Rexster::Ruby::VERSION

  gem.add_dependency 'httparty'
end
