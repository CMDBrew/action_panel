module ActiveAdmin

  module Views

    # Overwirte PaginatedCollection -
    # activeadmin/lib/active_admin/views/components/paginated_collection.rb
    class PaginatedCollection < ActiveAdmin::Component

      PAGINATION_EXLUSION = %i[calendar].freeze

      attr_reader :config

      # rubocop:disable Metrics/MethodLength
      def build(collection, options = {})
        @collection     = collection
        @params         = options.delete(:params)
        @param_name     = options.delete(:param_name)
        @download_links = options.delete(:download_links)
        @display_total  = options.delete(:pagination_total) { true }
        @per_page       = options.delete(:per_page)
        @config         = options.delete(:config) || {}

        unless collection.respond_to?(:total_pages)
          raise(StandardError,
                'Collection is not a paginated scope. Set collection.page(params[:page]).per(10)'\
                'before calling :paginated_collection.')
        end

        @contents = div(class: 'paginated_collection_contents')
        build_pagination_with_formats(options)
        @built = true
      end
      # rubocop:enable Metrics/MethodLength

      def pagination?
        (PAGINATION_EXLUSION + active_admin_config.namespace&.pagination_exclusion).
          exclude?(config[:as])
      end

      protected

      # rubocop:disable Rails/OutputSafety
      def build_pagination_with_formats(options)
        div id: 'index_footer' do
          if pagination?
            build_per_page_select if @per_page.is_a?(Array)
            build_pagination
            div(page_entries_info(options).html_safe, class: 'pagination_information')
          end
          formats = build_download_formats @download_links
          build_download_format_links formats if formats.any?
        end
      end
      # rubocop:enable Rails/OutputSafety

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
