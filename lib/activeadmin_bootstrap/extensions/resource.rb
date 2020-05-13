module ActiveAdmin

  # Overwrite Resource - activeadmin/lib/active_admin/resource.rb
  class Resource

    attr_writer :sidebar_position, :filter_position, :component_class, :action_item_display,
                :action_item_prefix

    def component_class
      namespace.component_class.merge(@component_class || {})
    end

    def action_item_display
      namespace.action_item_display.merge(@action_item_display || {})
    end

    def action_item_prefix
      namespace.action_item_prefix.merge(@action_item_prefix || {})
    end

    def sidebar_position
      @sidebar_position || namespace.sidebar_position
    end

    def filter_position
      @filter_position || namespace.filter_position
    end

  end

end
