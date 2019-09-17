source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Declare your gem's dependencies in activeadmin_bootstrap.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]
group :development, :test do
  # Generate fake data
  gem 'faker'
  # Find unused I18n keys
  gem 'i18n-tasks', '~> 0.9.21'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Use Interactive Editor for browser debug
  gem 'interactive_editor'
  # Use FactoryBot to generate fake data
  gem 'factory_bot_rails'
  # Use devise
  gem 'devise'
  # Rails Chrome Panel
  gem 'meta_request'
  # Postgres DB
  gem 'pg', '~> 0.15'
end

group :test do
  default_rails_version = '5.2.2'
  default_activeadmin_version = '2.2'

  gem 'rails', "~> #{ENV['RAILS'] || default_rails_version}"
  gem 'activeadmin', "~> #{ENV['AA'] || default_activeadmin_version}"

  # Validation
  gem 'shoulda-matchers', '~> 3.0', require: false
  # Use RSpec as Testing Framework
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 3.6'
  # Browser testing
  gem 'capybara'
  # gem 'selenium-webdriver'
  # gem 'chromedriver-helper'
  gem 'capybara-webkit'
  # gem 'capybara-screenshot'
  gem 'database_cleaner', '~> 1.6.2'
  # Spec Converage
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  # API Tests
  # gem 'webmock'
  # gem 'vcr'
end
