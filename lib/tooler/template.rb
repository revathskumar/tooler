module Tooler
  module Template

    def gemfile
      ::FileUtils.cp @options[:template_path]+"#{@options[:template]}/Gemfile", @options[:pwd]+"/Gemfile"
    end

    def procfile
      ::FileUtils.cp @options[:template_path]+"#{@options[:template]}/Procfile", @options[:pwd]+"/Procfile"
    end

    def gitignore
      ::FileUtils.cp @options[:template_path]+"gitignore", @options[:pwd]+"/.gitignore"
    end

    def license name=nil
      contents = file_read @options[:template_path]+"license/#{name||'mit'}.txt"
      contents = contents % {username: @options[:username] || "[Replace your fullname]", year: Time.new.strftime("%Y")}
      file_write @options[:pwd]+"/License", contents
    end

    def readme
      contents = file_read @options[:template_path]+"README.md"
      contents = contents % {name: @options[:name], description: ""}
      file_write @options[:pwd]+"/README.md", contents
    end

    def create_dir name
      ::FileUtils.mkdir @options[:pwd]+"/"+name
    end

    def file_read file_path
      File.read(file_path)
    end

    def file_write file_path, contents
      File.open(file_path, 'w+') do |f2|
        f2.puts contents
      end
    end
  end

end
