<<<<<<< HEAD
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'awe-rails'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  
end
=======
# Set up RSpec
require 'webmock/rspec'

Spec::Runner.configure do |config|
  config.include WebMock::API
end

# Set up generator tests
require 'rails/all'
require 'rails/generators'
require 'rails/generators/test_case'

class TestApp < Rails::Application
  config.root = File.dirname(__FILE__)
end
Rails.application = TestApp

module Rails
  def self.root
    @root ||= File.expand_path("../../tmp/rails", __FILE__)
  end
end
Rails.application.config.root = Rails.root

# Call configure to load the settings from
# Rails.application.config.generators to Rails::Generators
Rails::Generators.configure!


>>>>>>> ccf863516cd6c75a59a22dde092099839482274b
