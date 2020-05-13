require 'active_admin/dynamic_settings_node'

module ActiveAdmin

  # Overwrite NamespaceSettings - lib/active_admin/namespace_settings.rb
  class NamespaceSettings < DynamicSettingsNode

    # The default site_title content
    register :site_title_proc, nil

    # The default component_class
    register(:component_class,
             header: 'navbar-dark bg-dark navbar-expand-lg',
             title_bar: 'navbar-light bg-light',
             action_item: 'btn btn-secondary')

    # The default action_item display actions
    register(:action_item_display,
             new: 'index', edit: 'show', destroy: 'show')

    # The default action_item prefix
    register(:action_item_prefix,
             new: nil, edit: nil, destroy: nil)

    # The default sidebar position
    register :sidebar_position, 'right'

    # The default filter_position
    register :filter_position, 'sidebar'

    # Use rich textarea for active_admin_comments?
    register :active_admin_comment_input, 'text'

    # Pagination Exclusion
    register :pagination_exclusion, []

  end

end
