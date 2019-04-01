module ActiveAdmin

  # Overwrite Resource - activeadmin/lib/active_admin/resource.rb
  class Resource

    # The default sort order to use in the controller
    attr_writer :sidebar_position, :filter_position
    def sidebar_position
      @sidebar_position || WrapActiveAdmin.sidebar_position
    end

    def filter_position
      @filter_position || WrapActiveAdmin.filter_position
    end

  end

end
