$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'wrap_activeadmin/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'wrap_activeadmin'
  spec.version     = WrapActiveAdmin::VERSION
  spec.authors     = ['CMDBrew Studio Inc.']
  spec.email       = ['nelson@cmdbrew.com']
  spec.homepage    = 'http://www.cmdbrew.com'
  spec.summary     = 'WrapActiveAdmin is addon plugin to ActiveAdmin'
  spec.description = 'WrapActiveAdmin helps you speed up your backend development process'
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

  spec.add_dependency 'activeadmin', '~> 1.4.3'
  spec.add_dependency 'bootstrap', '~> 4.3.1'
  spec.add_dependency 'slim-rails'
  spec.add_dependency 'sass-rails'
  spec.add_dependency 'inline_svg', '~> 1.3.1'

  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'devise'
  spec.add_development_dependency 'faker'
  spec.add_development_dependency 'interactive_editor'
  spec.add_development_dependency 'letter_opener'
  spec.add_development_dependency 'pg', '~> 0.15'
  spec.add_development_dependency 'rename'
  spec.add_development_dependency 'thin'
end
