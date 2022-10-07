# frozen_string_literal: true

require_relative "lib/questionmark/barcodes/version"

Gem::Specification.new do |spec|
  spec.name = "questionmark-barcodes"
  spec.version = Questionmark::Barcodes::VERSION
  spec.authors = ["Wes Oldenbeuving - den Haan"]
  spec.email = ["wes@narnach.com"]

  spec.summary = "Barcode logic we share between API and Hoard"
  spec.description = "Private dependency that uses BarcodeValidation's custom class support"
  spec.homepage = "https://github.com/q-m"
  spec.license = "MIT"

  # Only support gems with official support. See https://www.ruby-lang.org/en/downloads/branches/
  spec.required_ruby_version = ">= 2.7.0"

  # This is set to a dummy value to prevent pushing to rubygems.org
  spec.metadata["allowed_push_host"] = "https://questionmark.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/q-m/questionmark-barcodes"
  spec.metadata["changelog_uri"] = "https://github.com/q-m/questionmark-barcodes/blob/stable/CHANGELOG.md"

  # Require multi-factor authentication to publish the gem
  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "barcodevalidation", "~> 2.6.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
