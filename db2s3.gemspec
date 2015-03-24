$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name          = 'bkwrapper'
  s.version       = '0.0.0'
  s.date          = '2015-03-24'
  s.summary       = 'Backup your databases and send them to your s3 account'
  s.description   = 'A simple wrapper over your database backup commands and s3 api.'
  s.authors       = ['Filipe Chagas']
  s.email         = 'filipe@ochagas.com'
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
  s.homepage      = 'http://rubygems.org/gems/db2s3'
  s.license       = 'MIT'

  s.add_runtime_dependency 'rake', '~> 10.4.2'
  s.add_runtime_dependency 'aws-sdk', '~> 2'
end
