module ActiveAdmin

  module Views

    # Overwrite IndexAsGrid - activeadmin/lib/active_admin/views/index_as_grid.rb
    class IndexAsGrid < ActiveAdmin::Component

      include ActionPanel::ConfigsFinder

      def size
        @page_presenter[:size] || component_class(:index_as_grid, :breakpoint)
      end

      protected

      def build_table
        resource_selection_toggle_panel if active_admin_config.batch_actions.any?
        div class: 'index_grid' do
          @collection.in_groups_of(number_of_columns).each do |group|
            build_row(group)
          end
        end
      end

      def build_row(group)
        div class: 'row' do
          group.each do |item|
            next if item.blank?

            build_item(item)
          end
        end
      end

      def build_item(item)
        div class: "#{column_klass} d-flex flex-column grid-item", for: item do
          instance_exec(item, &@page_presenter.block)
        end
      end

      def span_size
        12 / number_of_columns
      end

      def column_klass
        ['col', size, span_size].delete_if(&:blank?).join('-')
      end

    end

  end

end
