module ActiveAdmin

  class Resource

    # Register Htmls Resource
    module FloatActions

      # Adds the default action items to a resource when it's initialized
      def initialize(*args)
        super
        add_default_float_actions
      end

      def float_actions
        @float_actions ||= []
      end

      def clear_float_actions!
        @float_actions = []
      end

      def add_float_action(name, options = {}, &block)
        float_actions << ActiveAdmin::FloatAction.new(name, options, &block)
      end

      def remove_float_action(name)
        float_actions.delete_if { |item| item.name == name }
      end

      def float_actions_for(action, render_context = nil)
        float_actions.select do |section|
          section.display_on?(action, render_context)
        end.sort_by(&:priority)
      end

      def float_actions?
        @float_actions&.any?
      end

      private

      # Adds the default action items to each resource
      def add_default_float_actions
        add_default_new_float_action
      end

      # Adds the default New link on index
      def add_default_new_float_action
        add_float_action :new, only: :index do
          if controller.action_methods.include?('new') &&
             authorized?(ActiveAdmin::Auth::CREATE, active_admin_config.resource_class) &&
             active_admin_config.enable_float_actions
            link_to('<i class="mdi mdi-plus"></i>'.html_safe, new_resource_path)
          end
        end
      end

    end

  end

end
