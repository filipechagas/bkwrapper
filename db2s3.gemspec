Gem::Specification.new do |s|
  s.name        = 'db2s3'
  s.version     = '0.0.0'
  s.date        = '2015-03-24'
  s.summary     = "Backup your databases and send them to your s3 account"
  s.description = "A simple wrapper over your database backup commands and s3 api, making it easy to create database backups and sending them to your s3 account."
  s.authors     = ['Filipe Chagas']
  s.email       = 'filipe@ochagas.com'
  s.files       = ['lib/backup/*.rb', 'lib/s3/*.rb']
  s.homepage    =
    'http://rubygems.org/gems/db2s3'
  s.license       = 'MIT'
end
