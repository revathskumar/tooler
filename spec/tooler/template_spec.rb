require "spec_helper"

describe Tooler::Template do
  before :each do
    args = {arguments: ["cuba"]}
    @cli = Tooler::CLI.new args
    options = @cli.instance_variable_get(:@options)
    options.merge!({pwd: Tooler.root + "/tmp/"})
    @cli.instance_variable_set(:@options, options)
  end

  describe "#gemfile" do
    it "create gemfile" do
      @cli.gemfile
      File.exists?("tmp/Gemfile").should == true
    end
  end

  describe "#procfile" do
    it "create procfile" do
      @cli.procfile
      File.exists?("tmp/Procfile").should == true
    end
  end

  describe "#license" do
    it "create license" do
      @cli.license
      File.exists?("License").should == true
    end

    it "default to MIT license" do
      @cli.license
      File.open("tmp/License",'r').read.should match /The MIT License/
    end
  end

  describe "#readme" do
    it "create readme" do
      @cli.readme
      File.exists?("tmp/README.md").should == true
    end
  end

  describe "#create_dir" do
    it "create dir with name passed" do
      @cli.create_dir "tmp"
      File.directory?("tmp/tmp/").should == true
    end
  end

  describe "#file_read" do
    before :each do
      File.open("tmp/sample_file.txt", "w+") do |f |
        f.puts "This is a sample file"
      end
    end

    it "read a file and return contents" do
      @cli.file_read("tmp/sample_file.txt").should == "This is a sample file\n"
    end
  end

  describe "#file_write" do
    it "writes content into a file" do
      @cli.file_write "tmp/sample_write.txt", "This is a sample file"
      File.read("tmp/sample_write.txt").should == "This is a sample file\n"
    end
  end

  after :all do
    FileUtils.rm_rf Dir.glob('tmp/*')
    FileUtils.touch "tmp/.gitkeep"
  end
end
