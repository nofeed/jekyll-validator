# frozen_string_literal: true

require "rainbow/refinement"
require "w3c_validators"

require_relative "jekyll-validator/version"

module Jekyll
  class Validator
    class << self
      def call(file)
        Jekyll.logger.info "\nValidating #{file}"

        results = validate(file)

        Jekyll.logger.info "The file #{file} has #{results.errors.length} validation errors".red
        results.errors.each { |err| Jekyll.logger.info err.to_s.red }
      end

      private

      def html_validator
        @html_validator ||= ::W3CValidators::NuValidator.new
      end

      def css_validator
        @css_validator ||= ::W3CValidators::CSSValidator.new
      end

      def validate(file)
        case File.extname(file)
        when ".css"
          css_validator.validate_file(file)
        when ".html"
          html_validator.validate_file(file)
        end
      end
    end
  end
end

Jekyll::Hooks.register [:site], :post_write do |site|
  excluded = site.config["validator"]["exclude"]

  Dir.glob(File.join("_site", "**/*")).each do |file|
    next if File.directory?(file)
    next unless File.extname(file) =~ /.css|.html/

    Jekyll::Validator.call(file) unless excluded.any? { |path| file.include?(path) }
  end
end
