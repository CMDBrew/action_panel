module ActiveAdmin

  module Views

    # Overwirte TitleBar - activeadmin/lib/active_admin/views/title_bar.rb
    class TitleBar < Component

      def build(title, action_items)
        super(id: 'title_bar', class: "navbar #{title_bar_class}".strip)
        @title = title
        @action_items = action_items
        build_header_toggle
        build_titlebar_left
        build_titlebar_right
      end

      def title_bar_class
        @title_bar_class ||= active_admin_config.component_class[:title_bar].to_s
      end

      private

      def build_titlebar_left
        div id: 'titlebar_left' do
          build_breadcrumb
        end
      end

      def build_header_toggle
        button class: 'navbar-toggler',
               'data-target': '#header', 'data-toggle': 'collapse' do
          span class: 'navbar-toggler-icon'
        end
      end

      def build_titlebar_right
        return if @action_items.blank?

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
