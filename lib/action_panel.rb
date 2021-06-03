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
require 'action_panel/initializers/base'
require 'action_panel/initializers/view_helpers'
require 'action_panel/initializers/batch_actions'
require 'action_panel/initializers/formtastic'
require 'action_panel/initializers/inputs'
require 'action_panel/initializers/index_as_calendar'
require 'action_panel/initializers/html'
require 'action_panel/initializers/float_actions'
require 'action_panel/initializers/resource'
require 'action_panel/initializers/views'
require 'action_panel/initializers/orm'
require 'action_panel/initializers/others'

# Compilers
require 'sassc-rails'

# Engine
module ActionPanel

  autoload :VERSION,        'action_panel/version'
  autoload :ConfigsFinder,  'action_panel/helpers/configs_finder'
  autoload :ConfigsDefault, 'action_panel/helpers/configs_default'
  autoload :MdiIcon,        'action_panel/helpers/mdi_icon'

  def self.rails6?
    Rails.version.start_with? '6'
  end

end

# Require Engine
require 'action_panel/engine'
