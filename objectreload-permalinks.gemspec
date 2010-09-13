# -*- encoding: utf-8 -*-
require File.expand_path("../lib/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "objectreload-permalinks"
  s.version     = Permalinks::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mateusz Drożdżyński", "Ewa Limanówka", "Jakub Kuźma"]
  s.email       = "gems@objectreload.com"
  s.homepage    = "http://github.com/objectreload/permalinks"
  s.summary     = "Simple way to create permalinks."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "objectreload-permalinks"

  s.add_development_dependency "bundler", ">= 1.0.0.rc.6"
  s.add_development_dependency "test-unit", ">=2.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
