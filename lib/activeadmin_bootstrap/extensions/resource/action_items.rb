module ActiveAdmin

  class Resource

    # Overwriting ActionItems - activeadmin/lib/active_admin/resource/action_items.rb
    module ActionItems

      # Adds the default action items to each resource
      def add_default_action_items
        add_default_new_action_item
        add_default_edit_action_item
        add_default_destroy_action_item
      end

      # Adds the default New link on index
      def add_default_new_action_item
        add_action_item :new, only: proc { new_action_item_display } do
          if controller.action_methods.include?('new') &&
             authorized?(ActiveAdmin::Auth::CREATE, active_admin_config.resource_class)
            localizer = ActiveAdmin::Localizers.resource(active_admin_config)
            link_to localizer.t(:new_model), new_resource_path
          end
        end
      end

      # Adds the default Edit link on show
      def add_default_edit_action_item
        add_action_item :edit, only: proc { edit_action_item_display } do
          if controller.action_methods.include?('edit') &&
             authorized?(ActiveAdmin::Auth::UPDATE, resource)
            localizer = ActiveAdmin::Localizers.resource(active_admin_config)
            link_to localizer.t(:edit_model), edit_resource_path(resource)
          end
        end
      end

      # Adds the default Destroy link on show
      def add_default_destroy_action_item
        add_action_item :destroy, priority: 99, only: proc { destroy_action_item_display } do
          if controller.action_methods.include?('destroy') &&
             authorized?(ActiveAdmin::Auth::DESTROY, resource)
            link_to(destroy_btn_title, resource_path(resource),
                    method: :delete, data: { confirm: destroy_title, message: destroy_message })
          end
        end
      end

    end

  end

  # Model class to store the data for ActionItems
  class ActionItem

    def display_on?(action, render_context = self)
      @options[:only]   = Array(return_or_proc_exec(@options[:only]))   if @options[:only]
      @options[:except] = Array(return_or_proc_exec(@options[:except])) if @options[:except]
      super
    end

    private

    def return_or_proc_exec(option)
      option.is_a?(Proc) ? option.call : option
    end

    def normalize_display_options!
      @options[:only]   = @options[:only]   if @options[:only]
      @options[:except] = @options[:except] if @options[:except]
    end

  end

end
