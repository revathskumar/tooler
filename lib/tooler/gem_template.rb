module Tooler
  module Template

    def copy_template_gem
      gitignore
      license
      readme
      create_dir "lib"
      create_dir "lib/#{@options[:name]}"
      create_dir "spec"
      template
      gemfile
    end

    def template file_name, dest_file_name ,  vars
      contents = file_read @options[:template_path]+ file_name
      contents = contents % vars
      file_write @options[:pwd]+dest_file_name, contents
    end

    def gemspec
      vars = {
        name: @options[:name],
        username: @options[:username] || "[Replace your fullname]",
        email: @options[:email] || "[Replace your email]",
      }
      template "gem/gemspec", "#{@options[:name]}.gemspec",
    end
  end
end
