module ActiveAdmin

  class Resource

    # Register Htmls Resource
    module FloatActions

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

    end

  end

end
