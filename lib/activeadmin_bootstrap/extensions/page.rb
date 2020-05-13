module ActiveAdmin

  # Overwrite Page - activeadmin/lib/active_admin/page.rb
  class Page

    # The default sort order to use in the controller
    attr_writer :sidebar_position, :header_class, :title_bar_class, :action_item_class

    def header_class
      @header_class || namespace.header_class
    end

    def title_bar_class
      @title_bar_class || namespace.title_bar_class
    end

    def action_item_class
      @action_item_class || namespace.action_item_class
    end

    def sidebar_position
      @sidebar_position || namespace.sidebar_position
    end

  end

end
