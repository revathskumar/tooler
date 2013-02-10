
lib = File.expand_path('../lib',__FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "version"

Gem::Specification.new do |s|
  s.name        = 'Tooler'
  s.version     = Tooler::VERSION
  s.date        = '2013-02-10'
  s.summary     = "Tooler"
  s.description = "Ruby boilerplater"
  s.authors     = ["Revath S Kumar"]
  s.email       = ["rsk@revathskumar.com"]
  s.homepage    = "http://blog.revathskumar.com"
  s.files       = ["lib/*.rb", 'templates/*', "bin/*"]
  s.license     = 'MIT'

end