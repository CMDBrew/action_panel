module ActiveAdmin

  # Overwrite Resource - activeadmin/lib/active_admin/resource.rb
  class Resource

    attr_writer :sidebar_position, :filter_position, :body_class, :component_class,
                :action_item_configs, :enable_float_actions, :navigation

    def body_class
      @body_class || namespace.body_class
    end

    def navigation
      @navigation || namespace.navigation
    end

    def enable_float_actions
      @enable_float_actions || namespace.enable_float_actions
    end

    def component_class
      namespace.component_class.deep_merge(@component_class || {})
    end

    def action_item_configs
      namespace.action_item_configs.deep_merge(@action_item_configs || {})
    end

    def sidebar_position
      @sidebar_position || namespace.sidebar_position
    end

    def filter_position
      @filter_position || namespace.filter_position
    end

  end

end
