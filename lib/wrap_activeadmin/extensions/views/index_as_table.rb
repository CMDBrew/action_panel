module ActiveAdmin

  module Views

    # Overwrite IndexAsTable - activeadmin/lib/active_admin/views/index_as_table.rb
    class IndexAsTable < ActiveAdmin::Component

      def table_for(*args, &block)
        div class: 'table-responsive' do
          insert_tag IndexTableFor, *args, &block
        end
      end

      # Overwrite IndexTableActions
      class IndexTableFor < ::ActiveAdmin::Views::TableFor

        def dropdown_menu(*args, &block)
          options = args.extract_options!
          super(*args,
                options.merge(button: { class: WrapActiveAdmin::TABLE_BTN_CLASS + ' no-caret' }),
                &block)
        end

        # rubocop:disable all
        def actions(options = {}, &block)
          name          = options.delete(:name)     { '' }
          defaults      = options.delete(:defaults) { true }
          dropdown      = options.delete(:dropdown) { false }
          dropdown_name = options.delete(:dropdown_name) { waa_icon('menu.svg') }
          options[:class] ||= 'col-actions'

          column name, options do |resource|
            if dropdown
              dropdown_menu dropdown_name do
                defaults(resource) if defaults
                instance_exec(resource, &block) if block_given?
              end
            else
              table_actions do
                defaults(resource, css_class: :member_link) if defaults
                if block_given?
                  block_result = instance_exec(resource, &block)
                  text_node block_result unless block_result.is_a? Arbre::Element
                end
              end
            end
          end
        end

        private

        def defaults(resource, options = {})
          localizer = ActiveAdmin::Localizers.resource(active_admin_config)
          if controller.action_methods.include?('show') &&
            authorized?(ActiveAdmin::Auth::READ, resource)
            item localizer.t(:view), resource_path(resource),
                class: "view_link #{options[:css_class]}", title: localizer.t(:view)
          end

          if controller.action_methods.include?('edit') &&
            authorized?(ActiveAdmin::Auth::UPDATE, resource)
            item localizer.t(:edit), edit_resource_path(resource),
                class: "edit_link #{options[:css_class]}", title: localizer.t(:edit)
          end

          if controller.action_methods.include?('destroy') &&
            authorized?(ActiveAdmin::Auth::DESTROY, resource)
            item localizer.t(:delete), resource_path(resource),
                class: "delete_link #{options[:css_class]}", title: localizer.t(:delete),
                method: :delete,
                data: {
                  confirm: localizer.t(:delete_confirmation),
                  message: localizer.t(:delete_message)
                }
          end
        end
        # rubocop:enable all

        # Overwrite TableActions
        class TableActions < ActiveAdmin::Component

          def default_class_name
            'table_actions btn-group'
          end

          def item(*args)
            options = args.extract_options!
            options[:class] =
              "#{options[:class]} #{WrapActiveAdmin::TABLE_BTN_CLASS}".strip
            text_node link_to(*args, options)
          end

        end

      end

    end

  end

end
