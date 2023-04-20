# frozen_string_literal: true

require "jekyll"
require "vcr"

require File.join(__dir__, "../lib/jekyll-validator")

VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = true
  config.cassette_library_dir = File.join(__dir__, "fixtures/cassettes")
  config.hook_into :webmock
  config.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"

  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
