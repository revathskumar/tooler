
module Tooler
  class CLI
    include Tooler::Template

    def initialize args
      @options = {template: "", name: ""}
      parse args[:arguments]
      @options[:pwd] = ::FileUtils.pwd + "/"
      @options[:name] = @options[:pwd].split('/').last
      @options[:root_path] = Tooler.root
      @options[:template_path] = @options[:root_path] + "/templates/"
    end

    def start
      begin
        require "tooler/#{@options[:template]}_template"
      rescue LoadError
        raise Tooler::Error, "Invalid template"
      end
      send("copy_template_#{@options[:template]}")
    end

    private

    def parse args
      @options[:template] = args[0].downcase
    end

    def method_missing method_name, *args, &block
      p "method_missing #{method_name}"
      if method_name[/^copy_template_/]
        raise Tooler::Error, "Invalid template"
      else
        super
      end
    end
  end
end
