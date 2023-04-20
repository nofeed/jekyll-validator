# frozen_string_literal: true

RSpec.describe Jekyll::Validator do
  let(:config) do
    config = YAML.safe_load(File.read(File.join(__dir__, "../fixtures", "_config.yml")))
    Jekyll.configuration(config)
  end
  let(:site) { Jekyll::Site.new(config) }

  it "has a version number" do
    expect(Jekyll::Validator::VERSION).not_to be_nil
  end

  context "when on a website" do
    let(:validator) { class_double(described_class, call: nil) }
    let(:logger) { instance_double(Logger, info: nil) }

    context "when validating the site" do
      before do
        stub_const "Jekyll::Validator", validator
        site.process
      end

      it "is called for all included css anf html" do
        expect(validator).to have_received(:call).exactly(4).times
      end

      it "excludes excluded files" do
        expect(validator).not_to have_received(:call).with("_site/files/excluded.css")
      end
    end

    context "and validating html" do
      before do
        site.process
      end

      it "logs errors" do
        VCR.use_cassette("html_invalid") do
          allow(Jekyll).to receive(:logger).and_return(logger)
          described_class.call(File.join(__dir__, "../../_site/files", "invalid.html"))
          expect(logger).to have_received(:info).exactly(8).times
        end
      end

      it "does not log errors when valid" do
        VCR.use_cassette("html_valid") do
          allow(Jekyll).to receive(:logger).and_return(logger)
          described_class.call(File.join(__dir__, "../../_site/files", "valid.html"))
          expect(logger).to have_received(:info).exactly(2).times
        end
      end
    end

    context "and validating CSS" do
      before do
        site.process
      end

      it "logs errors" do
        VCR.use_cassette("css_invalid") do
          allow(Jekyll).to receive(:logger).and_return(logger)
          described_class.call(File.join(__dir__, "../../_site/files", "invalid.css"))
          expect(logger).to have_received(:info).exactly(3).times
        end
      end

      it "does not log errors when valid" do
        VCR.use_cassette("css_valid") do
          allow(Jekyll).to receive(:logger).and_return(logger)
          described_class.call(File.join(__dir__, "../../_site/files", "valid.css"))
          expect(logger).to have_received(:info).exactly(2).times
        end
      end
    end
  end
end
