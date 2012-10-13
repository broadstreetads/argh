require File.dirname(__FILE__) + '/lib/argh/version'

spec = Gem::Specification.new do |s|
  s.name = 'argh'
  s.author = 'Broadstreet Ads'
  s.add_development_dependency('rspec')
  s.description = 'Easy command-line argument building in Ruby'
  s.email = 'johnc@broadstreetads.com'
  s.files = Dir['lib/**/*.rb']
  s.has_rdoc = false
  s.homepage = 'https://github.com/broadstreetads/argh'
  s.platform = Gem::Platform::RUBY
  s.require_paths = ['lib']
  s.summary = 'Easy command-line arguments'
  s.test_files = Dir.glob('spec/**/*.rb')
  s.version = Argh::VERSION
end
