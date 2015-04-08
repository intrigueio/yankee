Gem::Specification.new do |s|
  s.name        = 'yankee'
  s.version     = '0.1.5'
  s.date        = '2015-04-08'
  s.summary     = "Intrigue intelligence analysis"
  s.description = "Intrigue intelligence analysis"
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
