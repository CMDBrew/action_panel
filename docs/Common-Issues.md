# Material icons not showing
Rails 6.0 replaces the gem "sass-rails" to just a wrapper for "sassc-rails" gem. See (release note)[https://github.com/rails/sass-rails/releases/tag/v6.0.0].

This change affects the SCSS file compression in development. To make the icons display correctly, add the following configs to your development configs.

```ruby
# config/environments/development.rb
config.assets.css_compressor = :sass
```

