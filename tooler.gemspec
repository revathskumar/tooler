
lib = File.expand_path('../lib',__FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'Tooler'
  s.version     = '0.0.1'
  s.date        = '2013-02-10'
  s.summary     = "Tooler"
  s.description = "Ruby boilerplater"
  s.authors     = ["Revath S Kumar"]
  s.email       = ["rsk@revathskumar.com"]
  s.homepage    = "http://blog.revathskumar.com"
  s.files       = ["lib/tooler.rb"]
  s.license     = 'MIT'

end