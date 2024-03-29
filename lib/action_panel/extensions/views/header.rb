module ActiveAdmin

  module Views

    # Overwrite Header - activeadmin/lib/active_admin/views/header.rb
    class Header < Component

      include ActionPanel::ConfigsFinder

      def tag_name
        :nav
      end

      def build(namespace, menu)
        super(id: 'header')

        @namespace    = namespace
        @menu         = menu
        @utility_menu = @namespace.fetch_menu(:utility_navigation)

        build_navigations
      end

      def header_class
        @header_class ||= component_class(:header)
      end

      private

      def build_navigations
        add_class "navbar #{header_class}".strip
        site_title @namespace
        navbar_toggler
        navbar_nav
      end

      def navbar_nav
        div id: 'header-nav', class: 'collapse navbar-collapse' do
          global_navigation @menu, id: 'main-nav', class: 'navbar-nav'
          utility_navigation @utility_menu, id: 'utility-nav', class: 'navbar-nav'
        end
      end

      def navbar_toggler
        button(class: 'navbar-toggler',
               'data-target': '#header-nav', 'data-toggle': 'collapse') do
          span class: 'navbar-toggler-icon'
        end
      end

    end

  end

end
