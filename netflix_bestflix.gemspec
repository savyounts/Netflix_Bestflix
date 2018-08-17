
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "netflix_bestflix/version"

Gem::Specification.new do |spec|
  spec.name          = "netflix_bestflix"
  spec.version       = NetflixBestflix::VERSION
  spec.authors       = ["'Sav Younts'"]
  spec.email         = ["'savyounts@gmail.com'"]

  spec.summary       = "Top Netflix movies and shows"
  spec.description   = "Provides details on the top 100+ Netflix movies and shows"
  spec.homepage      = "https://github.com/savyounts/Netflix_Bestflix"
  spec.license       = "MIT"
  spec.executables << 'netflix_bestflix'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
end
