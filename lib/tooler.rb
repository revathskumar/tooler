
module Tooler
  class CLI
    include Tooler::Template

    def initialize args
      @options = {template: "", name: ""}
      parse args[:arguments]
      @options[:pwd] = ::FileUtils.pwd + "/"
      @options[:name] = @options[:pwd].split('/').last
      @options[:template_path] = File.dirname(__FILE__) + "/../templates/"
    end

    def start
      p "Initializing #{@options[:template]}"
      p "Project Name #{@options[:name]}"
      begin
        require "#{@options[:template]}_template"
      rescue LoadError
        p "Invalid template name"
      end
      send("copy_template_#{@options[:template]}")
    end

    private

    def parse args
      @options[:template] = args[0].downcase
    end

    def get_name

    end

    def method_missing method_name, args
      p "method_missing #{method}"
      if method_name[/^copy_template_/]
        raise Tooler::Error, "Invalid template"
      else
        super
      end
    end
  end
end
