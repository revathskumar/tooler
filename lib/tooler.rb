
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
      begin
        send("copy_template_#{@options[:template].downcase}")
      rescue Tooler::Error => e
        
      end
    end

    private

    def parse args
      @options[:template] = args[0]
    end

    def get_name
      
    end

    def method_missing a
      p "method_missing"
      raise Tooler::Error.new, "Invalid template"
    end
  end
end