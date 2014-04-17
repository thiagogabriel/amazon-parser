if ENV['COVERAGE'] == '1'
  require 'simplecov'
  SimpleCov.start
end

require 'rspec'
require 'vcr'

RSpec.configure do |config|
  config.order = 'random'

  config.treat_symbols_as_metadata_keys_with_true_values = true
end


VCR.configure do |c|
  c.configure_rspec_metadata!
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
end
