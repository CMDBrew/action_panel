$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'activeadmin_bootstrap/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'activeadmin_bootstrap'
  spec.version     = ActiveAdminBootstrap::VERSION
  spec.authors     = ['CMDBrew Studio Inc.']
  spec.email       = ['nelson@cmdbrew.com']
  spec.homepage    = 'http://www.cmdbrew.com'
  spec.summary     = 'ActiveAdminBootstrap is addon plugin to ActiveAdmin'
  spec.description = 'ActiveAdminBootstrap helps you speed up your backend development process'
  spec.license     = 'Copyright CMDBrew Studio Inc.'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '>= 5.0.2'

  spec.add_dependency 'activeadmin', '~> 2.2'
  spec.add_dependency 'bootstrap', '~> 4.3.1'
  spec.add_dependency 'slim-rails'
  spec.add_dependency 'sass-rails'
  spec.add_dependency 'coffee-rails'
  spec.add_dependency 'select2-rails'
  spec.add_dependency 'inline_svg', '~> 1.3.1'
  spec.add_dependency 'trix-rails', '~> 2.0'
  spec.add_dependency 'jquery-ui-rails', '~> 6.0.1'
  spec.add_dependency 'jquery-rails'
  spec.add_dependency 'jquery-minicolors-rails'
  spec.add_dependency 'font-awesome-rails'
  spec.add_dependency 'just-datetime-picker'
  spec.add_dependency 'momentjs-rails'
  spec.add_dependency 'fullcalendar-rails', '~> 3.1'
  spec.add_dependency 'bootstrap-datepicker-rails'

  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'devise'
  spec.add_development_dependency 'faker'
  spec.add_development_dependency 'interactive_editor'
  spec.add_development_dependency 'letter_opener'
  spec.add_development_dependency 'pg', '~> 0.15'
  spec.add_development_dependency 'rename'
  spec.add_development_dependency 'thin'
end
