module Tooler
  module Template

    def copy_template_sinatra
      gitignore
      license
      readme
      create_dir "lib"
      create_dir "spec"
      create_dir "log"
      template
      gemfile
      procfile
    end

    def template
      ::FileUtils.cp @options[:template_path]+"sinatra/template.rb", @options[:pwd]+"sinatra/#{@options[:name]}.rb"
    end
  end
end