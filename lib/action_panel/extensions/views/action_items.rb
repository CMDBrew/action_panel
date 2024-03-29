module ActiveAdmin

  module Views

    # Overwrite ActionItems - activeadmin/lib/active_admin/views/action_items.rb
    class ActionItems < ActiveAdmin::Component

      include ActionPanel::ConfigsFinder
      include ActionPanel::MdiIcon

      def build(action_items)
        action_items.each do |action_item|
          instance_exec(&action_item.block)
        end
      end

      def destroy_message
        I18n.t('active_admin.delete_message')
      end

      def destroy_title
        I18n.t('active_admin.delete_confirmation')
      end

      def destroy_btn_title
        I18n.t('active_admin.delete_model', model: active_admin_config.resource_label).to_s
      end

      private

      def link_to(*args, &block)
        options = args.extract_options!
        options[:class] ||= component_class(:action_item, :item)
        text_node super(*args, options, &block)
      end

      def default_class_name
        "action_items #{component_class(:action_item, :group)}".strip
      end

    end

  end

end
