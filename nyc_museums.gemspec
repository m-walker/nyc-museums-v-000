# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nyc_museums/version'

Gem::Specification.new do |spec|
  spec.name          = "nyc_museums"
  spec.version       = NycMuseums::VERSION
  spec.authors       = ["m-walker"]
  spec.email         = ["michaelwalker610@gmail.com"]

  spec.summary       = %q{Listing all of NYC's Museums, with details, if desires}
  spec.description   = %q{The user can list all of NYC's Museums. They can inquire regardign details about any of them}
  spec.homepage      = https://github.com/m-walker/nyc-museums-v-000
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'http://mygemserver.com'
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
