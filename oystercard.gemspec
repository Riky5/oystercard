# frozen_string_literal: true

require_relative "lib/oystercard/version"

Gem::Specification.new do |spec|
  spec.name          = "oystercard"
  spec.version       = Oystercard::VERSION
  spec.authors       = ["kehinde alaka"]
  spec.email         = ["kennyalaka93@gmail.com"]

  spec.summary       = "Oystercard challange"
  spec.homepage      = "https://github.com/Alaka-K/oystercard"
  spec.required_ruby_version = Gem::Requirement.new(">= 3.0.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Alaka-K/oystercard"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_development_dependency "rspec", "~> 3.2"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
