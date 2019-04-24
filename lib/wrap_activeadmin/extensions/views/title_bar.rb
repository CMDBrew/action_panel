module ActiveAdmin

  module Views

    # Overwirte TitleBar - activeadmin/lib/active_admin/views/title_bar.rb
    class TitleBar < Component

      def build(title, action_items)
        super(id: 'title_bar', class: 'navbar')
        @title = title
        @action_items = action_items
        build_header_toggle
        build_titlebar_left
        build_titlebar_right
      end

      private

      def build_titlebar_left
        div id: 'titlebar_left' do
          build_breadcrumb
        end
      end

      def build_header_toggle
        return unless %w[sidebar].include? WrapActiveAdmin.instance_navigation
        button class: 'navbar-toggler mr-3 d-xl-none',
               'data-target': '#header', 'data-toggle': 'collapse' do
          span class: 'navbar-toggler-icon'
        end
      end

      def build_titlebar_right
        div id: 'titlebar_right' do
          build_action_items
          build_sidebar_toggle
        end
      end

      def build_sidebar_toggle
        button class: 'navbar-toggler sidebar-toggle',
               'data-target': '#sidebar-content', 'data-toggle': 'collapse' do
          span class: 'navbar-toggler-icon'
        end
      end

      def links
        breadcrumb_config = active_admin_config&.breadcrumb
        if breadcrumb_config.is_a?(Proc)
          instance_exec(controller, &active_admin_config.breadcrumb)
        elsif breadcrumb_config.present?
          breadcrumb_links
        end
      end

      def valid_links
        return if links.blank?
        links.delete_if { |x| x =~ %r{<a\ href="\/admin">Admin<\/a>} }
      end

      def build_breadcrumb(_separator = '/')
        ol id: 'breadcrumb', class: 'breadcrumb' do
          valid_links&.each do |link|
            li(text_node(link), class: 'breadcrumb-item')
          end
          li(text_node(@title), class: 'breadcrumb-item active')
        end
      end

    end

  end

end
