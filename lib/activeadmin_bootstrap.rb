# Require Gem Dependencies
require 'activeadmin'
require 'bootstrap'
require 'inline_svg'
require 'trix'
require 'font-awesome-rails'
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
require 'activeadmin_bootstrap/initializers/resource'
require 'activeadmin_bootstrap/initializers/views'
require 'activeadmin_bootstrap/initializers/orm'
require 'activeadmin_bootstrap/initializers/others'

# Compilers
require 'slim-rails'
require 'sass'

# Require Engine
require 'activeadmin_bootstrap/engine'

# Engine
module ActiveAdminBootstrap

  autoload :VERSION, 'activeadmin_bootstrap/version'

  ACTION_ITEM_CLASS            = 'action_item'.freeze
  TABLE_CLASS                  = 'table_for'.freeze
  TABLE_BTN_CLASS              = 'table_btn'.freeze
  TABLE_TOOLS_BTN_CLASS        = 'table_tool_btn'.freeze
  TABLE_TOOLS_BTN_ACTIVE_CLASS = 'table_tool_btn active'.freeze
  TAB_CLASS                    = 'nav_tabs'.freeze
  FORM_CANCEL_CLASS            = 'form_cancel'.freeze
  FORM_SUBMIT_CLASS            = 'form_submit'.freeze
  WRAPPER_CONTAINER_CLASS      = 'wrapper_container'.freeze
  CONTENT_CONTAINER_CLASS      = 'content_container'.freeze
  FLASH_CLASS                  = 'flash_message'.freeze
  COLUMN_BREAKPOINT            = 'md'.freeze
  SCOPE_COUNT_CLASS            = 'scope_count'.freeze

end
