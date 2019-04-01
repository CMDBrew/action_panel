module ActiveAdmin

  module Views

    # Overwrite Menu - activeadmin/lib/active_admin/views/components/menu.rb
    class Menu < Component

      # rubocop:disable Metrics/MethodLength
      def build(menu, options = {})
        dropdown    = options.delete(:dropdown) { false }
        menu_class  = dropdown ? 'dropdown-menu' : ''
        item_class  = dropdown ? 'dropdown-item' : ''
        menu_class += ' show' if dropdown && active_dropdown?(menu)

        @menu = menu
        super(options.reverse_merge!(class: menu_class))

        menu.items.each do |item|
          next unless helpers.render_in_context self, item.should_display
          menu_item(item, class: item_class, dropdown: dropdown)
        end
        children.sort!
      end
      # rubocop:enable Metrics/MethodLength

      private

      def active_dropdown?(menu)
        menu.current?(assigns[:current_tab]) && should_active_dropdown?
      end

      def should_active_dropdown?
        %w[sidebar aside].include? WrapActiveAdmin.instance_navigation
      end

    end

  end

end
