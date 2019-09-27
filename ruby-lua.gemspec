# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name     = "ruby-lua"
  s.description = "Call Lua from Ruby (and Ruby from Lua in Ruby)"
  s.summary  = "Call Lua from Ruby (and Ruby from Lua in Ruby)"

  s.version  = open(File.join(File.dirname(__FILE__), "VERSION")).read
  s.platform = Gem::Platform::RUBY

  s.authors  = ["Gregoire Lejeune"]
  s.email    = "gregoire.lejeune@free.fr"
  s.homepage = "http://github.com/glejeune/ruby-lua"
  s.license  = "MIT"

  s.files      = `find . -type f`.split("\n")
  s.test_files = `find test/ -type f`.split("\n")
  s.extra_rdoc_files = ["LICENSE.txt","README.rdoc"]
  s.extensions       = ["ext/extconf.rb"]
  s.require_paths    = ["lib"]

  s.add_development_dependency("shoulda")
  s.add_development_dependency("bundler")
  s.add_development_dependency("rdoc")
  s.add_development_dependency("rake")
  s.add_development_dependency("test-unit")
end

