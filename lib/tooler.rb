
module Tooler
  class CLI
    include Tooler::Template
    
    def initialize args
      @options = {template: "", name: ""}
      parse args[:arguments]
      @options[:pwd] = ::FileUtils.pwd
      @options[:name] = @options[:pwd].split('/').last
      @options[:template_path] = File.dirname(__FILE__)+"/../templates/"
    end

    def start
      p "Initializing #{@options[:template]}"
      p "Project Name #{@options[:name]}"
      send("copy_template_#{@options[:template].downcase}")
    end

    private

    def parse args
      @options[:template] = args[0]
    end

    def get_name
      
    end

    def method_missing method
      p "method_missing #{method}"
      raise Tooler::Error, "Invalid template"
    end
  end
end