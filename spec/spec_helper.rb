if ENV['COVERAGE'] == '1'
  require 'simplecov'
  SimpleCov.start
end

require 'rspec'

RSpec.configure do |config|
  config.order = 'random'
end
