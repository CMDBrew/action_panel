$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH << File.expand_path('support', __dir__)

require 'byebug'

ENV['BUNDLE_GEMFILE'] = File.expand_path('../Gemfile', __dir__)
require 'bundler'
Bundler.setup

ENV['RAILS_ENV'] = 'test'
# Ensure the Active Admin load path is happy
require 'rails/all'
ENV['RAILS'] = Rails.version
ENV['RAILS_ROOT'] = File.expand_path("../rails/rails-#{ENV['RAILS']}", __FILE__)
# Create the test app if it doesn't exists
system 'rake setup' unless File.exist?(ENV['RAILS_ROOT'])

# require 'active_model'
# require ActiveRecord to ensure that Ransack loads correctly
require 'active_record'
require 'active_admin'
ActiveAdmin.application.load_paths = [ENV['RAILS_ROOT'] + '/app/admin']
require ENV['RAILS_ROOT'] + '/config/environment.rb'

# require spec helpers
require 'support/active_admin_integration_spec_helper'
require 'support/active_admin_resource_spec_helper'

# Disabling authentication in specs so that we don't have to worry about
# it allover the place
ActiveAdmin.application.authentication_method = false
ActiveAdmin.application.current_user_method = false

require 'spec_helper'
require 'rspec/rails'
# require 'database_cleaner'
# require 'capybara/rails'
# require 'capybara/rspec'
# require 'selenium-webdriver'

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures = false
  config.render_views = false

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do |example|
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # Use webkit instead of Rspec Selenium default
  Capybara.javascript_driver = :webkit
  Capybara.server = :webrick

  # config.include Devise::Test::ControllerHelpers, type: :controller
  config.include ActiveAdminIntegrationSpecHelper
  config.include ActiveAdminResourceSpecHelper
end

# Force deprecations to raise an exception.
ActiveSupport::Deprecation.behavior = :raise
