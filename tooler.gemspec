
lib = File.expand_path('../lib',__FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "tooler/version"

Gem::Specification.new do |s|
  s.name          = 'tooler'
  s.version       = Tooler::VERSION
  s.date          = Time.new.strftime("%Y-%m-%d")
  s.summary       = "Tooler"
  s.description   = "Ruby boilerplater"
  s.authors       = ["Revath S Kumar"]
  s.email         = ["rsk@revathskumar.com"]
  s.homepage      = "http://revathskumar.github.com/tooler/"
  s.files         = ["License", "README.md","tooler.gemspec"]
  s.files         += Dir.glob("lib/**/*")
  s.files         += Dir.glob("templates/**/*")
  s.files         += Dir.glob("bin/*")
  s.files         += Dir.glob("spec/**/*")
  s.license       = 'MIT'
  s.bindir        = 'bin'
  s.require_paths = ['lib']
  s.executables   = %w(tooler)
  s.test_files    = Dir.glob("spec/**/*")
end
