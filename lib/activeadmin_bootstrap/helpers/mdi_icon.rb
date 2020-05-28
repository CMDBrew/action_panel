module ActiveAdminBootstrap

  # Finds Config Component Class
  module MdiIcon

    def mdi_icon(icon)
      "<i class='mdi-icon mdi mdi-#{icon}'></i>".html_safe
    end

  end

end
