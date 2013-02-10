module Tooler
  module Template

    def gitignore
      ::FileUtils.cp @options[:template_path]+"gitignore", @options[:pwd]+"/.gitignore"
    end

    def license name=nil
      p "Copying license"
      ::FileUtils.cp @options[:template_path]+"license/#{name||'mit'}.txt", @options[:pwd]+"/License"
    end

    def readme 
      p "Copying README"
      ::FileUtils.cp @options[:template_path]+"README.md", @options[:pwd]+"/README.md"
    end

    def create_dir name
      p "create dir #{name}"
      ::FileUtils.mkdir @options[:pwd]+"/"+name
    end
  end

end