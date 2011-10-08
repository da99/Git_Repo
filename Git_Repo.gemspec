# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "Git_Repo/version"

Gem::Specification.new do |s|
  s.name        = "Git_Repo"
  s.version     = Git_Repo::VERSION
  s.authors     = ["da99"]
  s.email       = ["i-hate-spam-45671204@mailinator.com"]
  s.homepage    = ""
  s.summary     = %q{Helpers to manipulate Git Repos}
  s.description = s.summary

  s.rubyforge_project = "Git_Repo"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.add_development_dependency 'bacon'
  s.add_development_dependency 'rake'
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
