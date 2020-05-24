module ActiveAdmin

  # Overwrite Page - activeadmin/lib/active_admin/page.rb
  class Page

    # The default sort order to use in the controller
    attr_writer :sidebar_position, :component_class, :body_class, :navigation

    def body_class
      @body_class || namespace.body_class
    end

    def navigation
      @navigation || namespace.navigation
    end

    def component_class
      namespace.component_class.merge(@component_class || {})
    end

    def sidebar_position
      @sidebar_position || namespace.sidebar_position
    end

  end

end
