module ActiveAdmin

  module Views

    # Overwrite MenuItem activeadmin/lib/active_admin/views/components/menu_item.rb
    class MenuItem < Component

      # rubocop:disable all
      def build(item, options = {})
        dropdown = options.delete(:dropdown) { false }

        super(options.merge(id: item.id))
        @label    = helpers.render_in_context self, item.label
        @url      = helpers.render_in_context self, item.url
        @priority = item.priority
        @submenu  = nil

        unless dropdown
          add_class 'nav-item'
          item.html_options.reverse_merge!(class: 'nav-link')
        end

        if item.current? assigns[:current_tab]
          add_class 'active'
          add_class 'show' if active_dropdown?
        end

        if item.items.any?
          item.html_options.merge!(class: 'nav-link dropdown-toggle', 'data-toggle': 'dropdown')
        end

        if url
          text_node link_to label, url, item.html_options
        else
          span label, item.html_options
        end

        return unless item.items.any?
        add_class 'has_nested dropdown'
        @submenu = menu(item, dropdown: true)
      end
      # rubocop:enable all

      private

      def active_dropdown?
        active_admin_config.navigation.eql?('sidebar')
      end

    end

  end

end
