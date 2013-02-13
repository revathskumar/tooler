require "spec_helper"

describe Tooler::CLI do

  it "raise exception when no template is passed" do
    expect { Tooler::CLI.new({arguments: []}) }.to raise_error(Tooler::Error, "Should specify a template")
  end

  describe "#start" do
    it "raise exception when invalid template is passed" do
      cli = Tooler::CLI.new({arguments: ["c"]})
      expect { cli.start }.to raise_error(Tooler::Error, "Invalid template")
    end
  end
end
