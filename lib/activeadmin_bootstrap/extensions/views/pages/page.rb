module ActiveAdmin

  module Views

    module Pages

      # Overwrite Pages::Page - activeadmin/lib/active_admin/views/pages/page.rb
      class Page < Base

        def body_classes
          Arbre::HTML::ClassList.new [
            params[:action],
            params[:controller].tr('/', '_'),
            'active_admin', 'logged_in', 'custom-page',
            active_admin_namespace.name.to_s + '_namespace',
            "navigation-#{active_admin_config.navigation}",
            sidebar_class
          ]
        end

      end

    end

  end

end
