module Tooler
  module Template

    def copy_template_cuba
      gitignore
      license
      readme
      create_dir "lib"
      create_dir "spec"
      create_dir "log"
    end
  end
end