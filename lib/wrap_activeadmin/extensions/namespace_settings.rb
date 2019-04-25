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

  end

end
