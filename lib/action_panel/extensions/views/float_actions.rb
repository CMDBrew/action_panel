module ActiveAdmin

  module Views

    # Overwrite FloatActions - activeadmin/lib/active_admin/views/float_actions.rb
    class FloatActions < ActiveAdmin::Component

      builder_method :float_actions

      include ActionPanel::ConfigsFinder
      include ActionPanel::MdiIcon

      def build(float_actions)
        float_actions.each do |float_action|
          text_node instance_exec(&float_action.block)
        end
      end

      private

      def link_to(*args, &block)
        options = args.extract_options!
        options[:class] = "#{component_class(:float_action, :item)} #{options[:class]}".strip
        super(*args, options, &block)
      end

      def default_class_name
        "float-actions #{component_class(:float_action, :group)}".strip
      end

    end

  end

end
