# WrapActiveAdmin
WrapActiveAdmin changed the theming for the popular gem **[ActiveAdmin](https://activeadmin.info/)** to **[Bootstrap 4](https://getbootstrap.com/)** while providing some common feature extensions to allow easy creation of beautiful applications with ActiveAdmin.

## Usage
To customize WrapActiveAdmin please see the **[Wiki](docs/Home.md)**

## Installation
### Add Gem
Add this line to your application's Gemfile:
```ruby
gem 'activeadmin', '~> 1.4.3'
gem 'wrap_activeadmin', git: 'https://github.com/CMDBrew/wrap_activeadmin_v2.git', branch: 'master'
```

And then execute:
```bash
bundle install
```

### Install ActiveAdmin
If you haven't already installed it
```bash
rails g active_admin:install
```

### Install WrapActiveAdmin
```bash
rails g wrap_activeadmin:install
```

Or do it manually
```scss
// app/assets/stylesheets/active_admin.scss
// replace active_admin with wrap_activeadmin
@import "wrap_activeadmin/mixins";
@import "wrap_activeadmin/base";
```

```coffee
# app/assets/javascripts/active_admin.js.coffee
# replace active_admin with wrap_activeadmin
#= require wrap_activeadmin/base
```

```ruby
# config/initializers/wrap_activeadmin.rb
# Create an initializer
# For more details on the configurations please see https://github.com/CMDBrew/wrap_activeadmin_v2/wiki/Configurations
```

### Install Styles
```bash
rails g wrap_activeadmin:styles
```

*p.s. Make sure you remove `= require_tree .` from `application.css` or else you will have sass compile errors.*

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
