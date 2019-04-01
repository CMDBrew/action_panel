module ActiveAdmin

  module Views

    # Overwirte PaginatedCollection -
    # activeadmin/lib/active_admin/views/components/paginated_collection.rb
    class PaginatedCollection < ActiveAdmin::Component

      # rubocop:disable all
      def build_per_page_select
        div class: 'pagination_per_page' do
          div class: 'input-group input-group-sm' do
            div class: 'input-group-prepend' do
              label I18n.t('active_admin.pagination.per_page'), class: 'input-group-text'
            end

            select(class: 'custom-select') do
              @per_page.each do |per_page|
                option(per_page,
                      value: per_page,
                      selected: collection.limit_value == per_page ? 'selected' : nil)
              end
            end
          end
        end
      end
      # rubocop:enable all

    end

  end

end
