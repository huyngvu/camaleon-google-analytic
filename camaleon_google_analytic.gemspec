$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'camaleon_google_analytic/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = 'camaleon_google_analytic'
  s.version = CamaleonGoogleAnalytic::VERSION
  s.authors = ['Huy nguyen']
  s.email = ['huyngvu@gmail.com']
  s.homepage = 'http://rubiik.com'
  s.summary = 'Camaleon Google analytics plugin'
  s.description = 'Camaleon Plugin to enable google analytics'

  s.files = Dir['{app,config,db,lib}/**/*', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.2'

  s.add_development_dependency 'sqlite3', '~> 1.3'
end
