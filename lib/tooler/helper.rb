module Tooler
  def self.root
    File.expand_path  "../../..", __FILE__
  end

  def self.help
    <<HELP_MESSAGE

$ tooler template_name

Available templates
  1. cuba
  2. sinatra

HELP_MESSAGE
  end
end
