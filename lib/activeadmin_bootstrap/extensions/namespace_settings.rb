require 'active_admin/dynamic_settings_node'

module ActiveAdmin

  # Overwrite NamespaceSettings - lib/active_admin/namespace_settings.rb
  class NamespaceSettings < DynamicSettingsNode

    # The default navigation
    register :navigation, 'top'
    # The default sidebar position
    register :sidebar_position, 'right'
    # The default filter_position
    register :filter_position, 'sidebar'
    # The default new action_item display
    register :new_action_item_display, :index
    # The default edit action_item display
    register :edit_action_item_display, :show
    # The default destroy action_item display
    register :destroy_action_item_display, :show
    # Use rich textarea for active_admin_comments?
    register :trix_active_admin_comments, true
    # Pagination Exclusion
    register :pagination_exclusion, []
    # Action Item Icons
    register :action_item_new_icon, ''
    register :action_item_edit_icon, ''
    register :action_item_delete_icon, ''

  end

end
