# Require Gem Dependencies
require 'activeadmin'
require 'bootstrap'
require 'inline_svg'
require 'trix'

# Require Initializers
require 'wrap_activeadmin/initializers/base'
require 'wrap_activeadmin/initializers/view_helpers'
require 'wrap_activeadmin/initializers/batch_actions'
require 'wrap_activeadmin/initializers/formtastic'
require 'wrap_activeadmin/initializers/inputs'
require 'wrap_activeadmin/initializers/resource'
require 'wrap_activeadmin/initializers/views'
require 'wrap_activeadmin/initializers/orm'
require 'wrap_activeadmin/initializers/others'

# Compilers
require 'slim-rails'
require 'sass'

# Require Engine
require 'wrap_activeadmin/engine'

# Engine
module WrapActiveAdmin

  autoload :VERSION, 'wrap_activeadmin/version'

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
  MENU_BADGE_CLASS             = 'menu_badge'.freeze

end
