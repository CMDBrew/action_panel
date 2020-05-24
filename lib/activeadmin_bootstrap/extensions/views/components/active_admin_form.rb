module ActiveAdmin

  module Views

    # Overwrite ActiveAdminForm - lib/activeadmin_bootstrap/extensions/form_builder.rb
    class ActiveAdminForm < FormtasticProxy

      include ActiveAdminBootstrap::ConfigsFinder

      def commit_action_with_cancel_link
        add_create_another_checkbox
        action(:submit, button_html: { class: component_class(:form, :actions, :submit) })
        cancel_link({ action: 'index' }, class: component_class(:form, :actions, :cancel))
      end

      def action(method, options = {})
        if method.eql?(:submit)
          options.merge!(button_html: { class: component_class(:form, :actions, :submit) })
        end

        super(method, options)
      end

    end

  end

end
