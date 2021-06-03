module ActiveAdmin

  module Views

    # Overwrite MenuItem activeadmin/lib/active_admin/views/components/menu_item.rb
    class MenuItem < Component

      include ActionPanel::MdiIcon

      attr_reader :icon

      # rubocop:disable all
      def build(item, options = {})
        dropdown = options.delete(:dropdown) { false }

        super(options.merge(id: item.id))
        @label    = helpers.render_in_context self, item.label
        @url      = helpers.render_in_context self, item.url
        @icon     = helpers.render_in_context self, item.mdi_icon
        @priority = item.priority
        @submenu  = nil

        unless dropdown
          add_class 'nav-item'
          item.html_options.reverse_merge!(class: 'nav-link')
        end

        add_class 'active' if item.current? assigns[:current_tab]

        if item.items.any?
          item.html_options.merge!(class: 'nav-link dropdown-toggle', 'data-toggle': 'dropdown')
        end

        if url
          text_node link_to menu_label, url, item.html_options
        else
          span menu_label, item.html_options
        end

        return unless item.items.any?
        add_class 'has_nested dropdown'
        @submenu = menu(item, dropdown: true)
      end
      # rubocop:enable all

      private

      def menu_label
        html = []
        html.push mdi_icon(icon) if icon.present?
        html.push label
        safe_join html
      end

    end

  end

end
