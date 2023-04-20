# frozen_string_literal: true

require_relative "lib/jekyll-validator/version"

# TODO
Gem::Specification.new do |spec|
  spec.name = "jekyll-validator"
  spec.version = Jekyll::Validator::VERSION
  spec.authors = ["Nicholas Wieland"]
  spec.email = ["ngw@nofeed.org"]
  spec.homepage = "https://github.com/nofeed/jekyll-validator"

  spec.summary = "Validates html against W3C Validator."
  spec.description = "Calls the W3C Validator API with every page Jekyll generates and displays the validation errors."
  # spec.homepage = "TODO: Put your gem's website or public repo URL here."
  spec.required_ruby_version = ">= 2.6.0"
  spec.licenses = ["Beerware"]

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/nofeed/jekyll-validator"
  spec.metadata["changelog_uri"] = "https://github.com/nofeed/jekyll-validator/blob/main/CHANGELOG.md"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ["lib"]

  spec.add_dependency "jekyll", ">= 3.0", "< 5.0"
  spec.add_dependency "rainbow", ">= 3.0", "< 4.0"
  spec.add_dependency "w3c_validators", ">= 1.0", "< 2.0"

  spec.metadata["rubygems_mfa_required"] = "true"
end
