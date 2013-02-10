module Tooler
  module Template

    def copy_template_cuba
      gitignore
      license
      readme
      create_dir "lib"
      create_dir "spec"
      create_dir "log"
      template
      config_ru
      gemfile
      procfile
    end

    def template
      contents = file_read @options[:template_path]+'cuba/config.ru'
      contents = contents % {name: @options[:name]}
      file_write @options[:pwd]+"/config.ru", contents
    end

    def config_ru
      contents = file_read @options[:template_path]+'cuba/cuba_template.rb'
      contents = contents % {name: @options[:name]}
      file_write @options[:pwd]+"/lib/#{@options[:name]}.rb", contents
    end
  end
end