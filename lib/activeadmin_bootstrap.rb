# Require Gem Dependencies
require 'activeadmin'
require 'bootstrap'
require 'fullcalendar-rails'
require 'momentjs-rails'
require 'select2-rails'
require 'jquery-minicolors-rails'
require 'bootstrap-datepicker-rails'
require 'just-datetime-picker'

# Require Initializers
require 'activeadmin_bootstrap/initializers/base'
require 'activeadmin_bootstrap/initializers/view_helpers'
require 'activeadmin_bootstrap/initializers/batch_actions'
require 'activeadmin_bootstrap/initializers/formtastic'
require 'activeadmin_bootstrap/initializers/inputs'
require 'activeadmin_bootstrap/initializers/index_as_calendar'
require 'activeadmin_bootstrap/initializers/html'
require 'activeadmin_bootstrap/initializers/float_actions'
require 'activeadmin_bootstrap/initializers/resource'
require 'activeadmin_bootstrap/initializers/views'
require 'activeadmin_bootstrap/initializers/orm'
require 'activeadmin_bootstrap/initializers/others'

# Compilers
require 'sassc-rails'

# Engine
module ActiveAdminBootstrap

  autoload :VERSION,        'activeadmin_bootstrap/version'
  autoload :ConfigsFinder,  'activeadmin_bootstrap/helpers/configs_finder'
  autoload :ConfigsDefault, 'activeadmin_bootstrap/helpers/configs_default'
  autoload :MdiIcon,        'activeadmin_bootstrap/helpers/mdi_icon'

  def self.rails6?
    Rails.version.start_with? '6'
  end

end

# Require Engine
require 'activeadmin_bootstrap/engine'
