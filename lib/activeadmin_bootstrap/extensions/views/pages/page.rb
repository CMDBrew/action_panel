module ActiveAdmin

  module Views

    module Pages

      # Overwrite Pages::Page - activeadmin/lib/active_admin/views/pages/page.rb
      class Page < Base

        def body_classes
          Arbre::HTML::ClassList.new [
            params[:action],
            params[:controller].tr('/', '_'),
            'active_admin', 'logged_in', 'page',
            active_admin_namespace.name.to_s + '_namespace'
          ]
        end

      end

    end

  end

end
