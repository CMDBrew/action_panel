module ActiveAdmin

  module Views

    # Overwirte TitleBar - activeadmin/lib/active_admin/views/title_bar.rb
    class TitleBar < Component

      def build(namespace, title, action_items)
        super(id: 'title_bar', class: 'navbar')
        @title = title
        @action_items = action_items
        div class: 'nav-head' do
          build_header_toggle
          # TODO: create custom component for titlebar_title
          site_title namespace
        end
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
        return unless %w[sidebar].include? active_admin_config.navigation

        button class: 'navbar-toggler',
               'data-target': '#header', 'data-toggle': 'collapse' do
          span class: 'navbar-toggler-icon'
        end
      end

      def build_titlebar_right
        div id: 'titlebar_right' do
          build_action_items
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

      def build_action_items
        action_items = @action_items.group_by(&:group)
        action_items.each do |_index, items|
          insert_tag(view_factory.action_items, items)
        end
      end

    end

  end

end
