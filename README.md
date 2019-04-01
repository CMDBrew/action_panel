# WrapActiveAdmin
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:
```ruby
gem 'wrap_activeadmin'
```

And then execute:
```bash
bundle install
```

Install ActiveAdmin if you haven't already installed it
```bash
rails g active_admin:install
```

## Contributing
- Clone this gem.
- Create dummy rails app inside `spec/dummy`
- add `require "wrap_activeadmin"` to your `application.rb`

Replace `bin/boot`
```ruby
# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../../Gemfile', __dir__)

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])
$LOAD_PATH.unshift File.expand_path('../../../lib', __dir__)
```

Replace `bin/setup`
```ruby
#!/usr/bin/env ruby
require 'fileutils'
include FileUtils

# path to your application root.
APP_ROOT = File.expand_path('..', __dir__)

def system!(*args)
  system(*args) || abort("\n== Command #{args} failed ==")
end

chdir APP_ROOT do
  # This script is a starting point to setup your application.
  # Add necessary setup steps to this file.

  puts '== Installing dependencies =='
  system! 'gem install bundler --conservative'
  system('bundle check') || system!('bundle install')

  # Install JavaScript dependencies if using Yarn
  # system('bin/yarn')

  # puts "\n== Copying sample files =="
  # unless File.exist?('config/database.yml')
  #   cp 'config/database.yml.sample', 'config/database.yml'
  # end

  puts "\n== Preparing database =="
  system! 'bin/rails db:setup'

  puts "\n== Removing old logs and tempfiles =="
  system! 'bin/rails log:clear tmp:clear'

  puts "\n== Restarting application server =="
  system! 'bin/rails restart'
end
```

Install app on your local
```
$ bundle install
$ bundle install --gemfile=.overcommit_gems.rb
$ chmod +x bin/setup_overcommit
$ overcommit --install
```

## License
