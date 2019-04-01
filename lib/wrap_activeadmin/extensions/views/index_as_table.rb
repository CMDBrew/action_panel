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
          super(*args, options.merge(button: { class: WrapActiveAdmin::TABLE_BTN_CLASS }), &block)
        end

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
