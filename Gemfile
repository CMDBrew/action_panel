source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

eval_gemfile(File.expand_path('Gemfile.common', __dir__))

# Declare your gem's dependencies in activeadmin_bootstrap.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.

group :lint do
  # Code style
  gem 'rubocop', '0.75.0'
end

gem 'rails', '~> 6.0'
gem 'webpacker', '~> 4.0'

gemspec path: '.'
