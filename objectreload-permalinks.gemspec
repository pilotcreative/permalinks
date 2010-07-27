# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{objectreload-permalinks}
  s.version = "0.2.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mateusz Drożdżyński", "Ewa Limanówka", "Jakub Kuźma"]
  s.date = %q{2010-07-27}
  s.email = %q{gems@objectreload.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    ".gitignore",
     "README",
     "Rakefile",
     "VERSION",
     "lib/permalinks.rb",
     "lib/permalinks/configuration.rb",
     "lib/permalinks/has_permalink.rb",
     "objectreload-permalinks.gemspec",
     "rails/init.rb",
     "test/country_test.rb",
     "test/post_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/objectreload/permalinks}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Simple way to create permalinks.}
  s.test_files = [
    "test/country_test.rb",
     "test/test_helper.rb",
     "test/post_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<test-unit>, [">= 2.0"])
    else
      s.add_dependency(%q<test-unit>, [">= 2.0"])
    end
  else
    s.add_dependency(%q<test-unit>, [">= 2.0"])
  end
end

