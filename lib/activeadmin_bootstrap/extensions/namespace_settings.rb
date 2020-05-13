require 'active_admin/dynamic_settings_node'

module ActiveAdmin

  # Overwrite NamespaceSettings - lib/active_admin/namespace_settings.rb
  class NamespaceSettings < DynamicSettingsNode

    # The default site_title content
    register :site_title_proc, nil

    # The default header_class
    register :header_class, 'navbar-dark bg-dark navbar-expand-lg'

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
    register :active_admin_comment_input, 'text'

    # Pagination Exclusion
    register :pagination_exclusion, []

    # Action Item Icons
    register :action_item_new_label_prefix, ''
    register :action_item_edit_label_prefix, ''
    register :action_item_delete_label_prefix, ''

  end

end
