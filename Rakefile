require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task :enable_coverage do
  ENV['COVERAGE'] = '1'
end

desc 'Default rake task (run all specs with code coverage enabled)'
task :default => [:enable_coverage, :spec]
