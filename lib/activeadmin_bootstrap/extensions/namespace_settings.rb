module ActiveAdmin

  # Overwrite NamespaceSettings - lib/active_admin/namespace_settings.rb
  class NamespaceSettings < DynamicSettingsNode

    Configs = ActiveAdminBootstrap::ConfigsDefault

    # The default site_title content
    register :site_title_proc, nil

    # The default body_class
    register :body_class, nil

    # The default navigation style
    register :navigation, Configs::NAVIGATION_CLASS

    # The default component_class
    register :component_class, Configs::COMPONENT_CLASS

    # The default action_item configs
    register :action_item_configs, Configs::ACTION_ITEM_CONFIGS

    # The default sidebar position
    register :sidebar_position, Configs::SIDEBAR_POSITION

    # The default filter_position
    register :filter_position, Configs::FILTER_POSITION

    # Use rich textarea for active_admin_comments?
    register :active_admin_comment_input, Configs::ACTIVE_ADMIN_COMMENT_INPUT

    # Pagination Exclusion
    register :pagination_exclusion, Configs::PAGINATION_EXCLUSION

  end

end
