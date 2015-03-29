Gem::Specification.new do |s|
  s.name        = 'yankee'
  s.version     = '0.0.8'
  s.date        = '2015-03-28'
  s.summary     = "Webserver for your filesystem"
  s.description = "Webserver for your filesystem"
  s.authors     = ["jcran"]
  s.email       = 'jcran@pentestify.com'
  s.files       = ["api.rb"]
  s.homepage    =
    'http://github.com/pentestify/yankee'
  s.license       = 'BSD'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  #s.require_paths = ["lib"]

end
