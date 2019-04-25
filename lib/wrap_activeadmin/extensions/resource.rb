module ActiveAdmin

  # Overwrite Resource - activeadmin/lib/active_admin/resource.rb
  class Resource

    # The default sort order to use in the controller
    attr_writer :sidebar_position, :filter_position, :navigation

    def navigation
      @navigation || namespace.navigation
    end

    def sidebar_position
      @sidebar_position || namespace.sidebar_position
    end

    def filter_position
      @filter_position || namespace.filter_position
    end

  end

end
