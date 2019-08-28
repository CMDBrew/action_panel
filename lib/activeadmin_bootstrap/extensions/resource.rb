module ActiveAdmin

  # Overwrite Resource - activeadmin/lib/active_admin/resource.rb
  class Resource

    attr_writer :sidebar_position, :filter_position, :navigation,
                :new_action_item_display, :edit_action_item_display,
                :destroy_action_item_display, :action_item_new_icon,
                :action_item_edit_icon, :action_item_delete_icon

    def navigation
      @navigation || namespace.navigation
    end

    def sidebar_position
      @sidebar_position || namespace.sidebar_position
    end

    def filter_position
      @filter_position || namespace.filter_position
    end

    def new_action_item_display
      @new_action_item_display || namespace.new_action_item_display
    end

    def edit_action_item_display
      @edit_action_item_display || namespace.edit_action_item_display
    end

    def destroy_action_item_display
      @destroy_action_item_display || namespace.destroy_action_item_display
    end

    def action_item_new_icon
      @action_item_new_icon || namespace.action_item_new_icon
    end

    def action_item_edit_icon
      @action_item_edit_icon || namespace.action_item_edit_icon
    end

    def action_item_delete_icon
      @action_item_delete_icon || namespace.action_item_delete_icon
    end

  end

end
