require 'rspec/core/rake_task'
require File.dirname(__FILE__) + '/lib/argh/version'

task :build => :test do
  system "gem build argh.gemspec"
end

task :release => :build do
  # tag and push
  system "git tag v#{Argh::VERSION}"
  system "git push origin --tags"
  # push the gem
  system "gem push argh-#{Argh::VERSION}.gem"
end

RSpec::Core::RakeTask.new(:test) do |t|
  t.pattern = 'spec/**/*_spec.rb'
  fail_on_error = true # be explicit
end
