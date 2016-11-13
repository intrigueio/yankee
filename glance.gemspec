Gem::Specification.new do |s|
  s.name        = 'glance'
  s.version     = '0.1.0'
  s.date        = '2016-04-09'
  s.summary     = "Intrigue Glance"
  s.description = "Intrigue Glance"
  s.authors     = ["jcran"]
  s.email       = 'jcran@intrigue.io'
  s.files       = ["glance.rb"]
  s.homepage    = 'http://github.com/intrigueio/glance'
  s.license       = 'BSD'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  #s.require_paths = ["lib"]

end
