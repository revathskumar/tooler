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
      config_ru
    end

    def template
      ::FileUtils.cp @options[:template_path]+"sinatra/template.rb", @options[:pwd]+"lib/#{@options[:name]}.rb"
    end

    def config_ru
      contents = file_read @options[:template_path]+'sinatra/config.ru'
      contents = contents % {name: @options[:name]}
      file_write @options[:pwd]+"/config.ru", contents
    end
  end
end
