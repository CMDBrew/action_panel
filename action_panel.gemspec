$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'action_panel/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'action_panel'
  spec.version     = ActionPanel::VERSION
  spec.authors     = ['CMDBrew Studio Inc.']
  spec.email       = ['nelson@cmdbrew.com']
  spec.homepage    = 'http://www.cmdbrew.com'
  spec.summary     = 'ActionPanel is addon plugin to ActiveAdmin'
  spec.description = 'ActionPanel helps you speed up your backend development process'
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

  spec.add_dependency 'rails', '~> 6.0'

  spec.add_dependency 'activeadmin', '~> 2.3.1'
  spec.add_dependency 'bootstrap', '~> 4.3.1'
  spec.add_dependency 'sass-rails'
  spec.add_dependency 'coffee-rails'
  spec.add_dependency 'select2-rails'
  spec.add_dependency 'jquery-ui-rails', '~> 6.0.1'
  spec.add_dependency 'jquery-rails'
  spec.add_dependency 'jquery-minicolors-rails'
  spec.add_dependency 'just-datetime-picker'
  spec.add_dependency 'momentjs-rails'
  spec.add_dependency 'fullcalendar-rails', '~> 3.1'
  spec.add_dependency 'bootstrap-datepicker-rails'
end
