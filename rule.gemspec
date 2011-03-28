# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rule/version"

Gem::Specification.new do |s|
  s.name        = "rule"
  s.version     = Rule::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Burke Libbey"]
  s.email       = ["burke@burkelibbey.org"]
  s.homepage    = ""
  s.summary     = %q{Rules on Rails}
  s.description = %q{Rule Engine sort of thing for Rails.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
