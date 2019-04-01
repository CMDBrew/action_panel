module ActiveAdmin

  class Resource

    # Overwriting ActionItems - activeadmin/lib/active_admin/resource/action_items.rb
    module ActionItems

      # Adds the default Destroy link on show
      def add_default_show_action_item
        add_action_item :destroy, dropdown: true, priority: 99, only: :show do
          if destroy_action?
            link_to(destroy_btn_title, resource_path(resource),
                    method: :delete, data: { confirm: destroy_title, message: destroy_message })
          end
        end
      end

    end

  end

end
