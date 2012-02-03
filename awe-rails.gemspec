# -*- encoding: utf-8 -*-
require File.expand_path('../lib/jquery/rails/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "awe-rails"
  s.version     = Awe::Rails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Shyam Habarakada"]
  s.email       = [""]
  s.homepage    = "http://rubygems.org/gems/awe-rails"
  s.summary     = "Use AWE (artefact web extensions) with Rails 3"
  s.description = "This gem provides AWE for your Rails 3 application."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "awe-rails"

  s.add_dependency "railties", "~> 3.0"
  s.add_dependency "thor",     "~> 0.14"
  s.add_development_dependency "bundler", "~> 1.0.0"
  s.add_development_dependency "rails",   "~> 3.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").select{|f| f =~ /^bin/}
  s.require_path = 'lib'
end