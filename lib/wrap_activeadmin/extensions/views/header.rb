module ActiveAdmin

  module Views

    # Overwrite Header - activeadmin/lib/active_admin/views/header.rb
    class Header < Component

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

      private

      def build_navigations
        case WrapActiveAdmin.instance_navigation
        when 'top', 'fixed_top' then header_navigation
        when 'sidebar' then sidebar_navigation
        when 'aside'   then aside_navigation
        else raise "Navigation '#{WrapActiveAdmin.instance_navigation}' is not available"
        end
      end

      def build_navs
        global_navigation @menu, id: 'main-nav', class: 'navbar-nav'
        utility_navigation @utility_menu, id: 'utility-nav', class: 'navbar-nav'
      end

      def instance_klass
        @instance_klass ||=
          "#{WrapActiveAdmin.instance_navigation} #{WrapActiveAdmin.instance_header_class}"
      end

      def header_navigation
        add_class "navbar navbar-expand-lg #{instance_klass}"

        site_title @namespace

        button class: 'navbar-toggler', 'data-target': '#header-nav', 'data-toggle': 'collapse' do
          span class: 'navbar-toggler-icon'
        end

        div id: 'header-nav', class: 'collapse navbar-collapse' do
          build_navs
        end
      end

      def aside_navigation
        add_class "navbar navbar-expand-xl #{instance_klass}"

        button class: 'navbar-toggler mr-3 d-xl-none',
               'data-target': '#aside-nav', 'data-toggle': 'collapse' do
          span class: 'navbar-toggler-icon'
        end

        site_title @namespace

        div id: 'header-nav' do
          utility_navigation @utility_menu, id: 'utility-nav', class: 'navbar-nav'
        end
      end

      def sidebar_navigation
        add_class "navbar navbar-expand #{instance_klass}"
        site_title @namespace
        div(id: 'header-nav') { build_navs }
      end

    end

  end

end
