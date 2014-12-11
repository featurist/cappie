# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "cappie/version"

Gem::Specification.new do |s|
  s.name        = 'cappie'
  s.version     = Cappie::VERSION
  s.authors     = ["Josh Chisholm"]
  s.email       = "josh@featurist.co.uk"
  s.description = 'Instant capybara/cucumber/rspec/selenium-webdriver configuration for any web app'
  s.summary     = "cappie-#{s.version}"
  s.homepage    = "http://github.com/featurist/cappie"

  s.platform    = Gem::Platform::RUBY

  s.add_runtime_dependency 'cucumber', '>= 1.3.16'
  s.add_runtime_dependency 'capybara', '>= 2.4.1'
  s.add_runtime_dependency 'procession', '>= 0.0.3'
  s.add_runtime_dependency 'rspec-expectations', '>= 3.0.4'
  s.add_runtime_dependency 'selenium-webdriver', '>= 2.29.0'
  s.add_runtime_dependency 'poltergeist', '>= 1.5.1'

  s.add_development_dependency 'rack', '>= 1.5.2'

  s.rubygems_version = ">= 1.6.1"
  s.files            = `git ls-files`.split("\n").reject {|path| path =~ /\.gitignore$/ }
  s.test_files       = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables      = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.rdoc_options     = ["--charset=UTF-8"]
  s.require_path     = "lib"
end
