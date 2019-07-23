module ActiveAdmin

  module Views

    module Pages

      # Overwriting Views::Pages::Index - activeadmin/lib/active_admin/views/pages/index.rb
      class Index < Base

        def main_content
          build_table_tools
          wrap_with_batch_action_form do
            build_collection
          end
        end

        # rubocop:disable all
        def build_table_tools
          div class: 'table_tools' do
            div build_scopes, class: 'mb-3 tab-ctrls'
            div class: 'scope_ctrls' do
              build_batch_actions_selector
              build_index_list
              build_filter_ctrl
            end
          end if any_table_tools?
        end
        # rubocop:enable all

        protected

        # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
        def render_index
          renderer_class = find_index_renderer_class(config[:as])
          paginator      = config.fetch(:paginator, true)
          download_links =
            config.fetch(:download_links, active_admin_config.namespace.download_links)
          pagination_total = config.fetch(:pagination_total, true)
          per_page         = config.fetch(:per_page, active_admin_config.per_page)

          paginated_collection(collection,
                               entry_name: active_admin_config.resource_label,
                               entries_name:
                                active_admin_config.plural_resource_label(count: collection_size),
                               download_links: download_links,
                               paginator: paginator,
                               per_page: per_page,
                               pagination_total: pagination_total,
                               config: config) do
            div class: 'index_content' do
              insert_tag(renderer_class, config, collection)
            end
          end
        end
        # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

        private

        def build_filter_ctrl
          return unless active_admin_config.filter_position.eql?('table_tools')

          dropdown_menu I18n.t('active_admin.sidebars.filters'),
                        class: 'filter-dropdown',
                        menu: { class: 'dropdown-menu-right' } do
            filter_sections.collect { |x| raw_item(sidebar_section(x)) }
          end
        end

        def filter_section?(section)
          section.name.to_sym == :filters
        end

        def filter_sections
          sections = []
          available_sidebar_sections.collect do |section|
            next unless filter_section?(section)

            sections.push section
          end
          sections
        end

        def skip_sidebar?
          sidebar_sections_for_action.empty? || assigns[:skip_sidebar] == true
        end

        def available_sidebar_sections
          if active_admin_config&.sidebar_sections?
            active_admin_config.sidebar_sections_for(params[:action], self)
          else
            []
          end
        end

        def sidebar_sections_for_action
          case active_admin_config.filter_position
          when 'table_tools'
            available_sidebar_sections.reject { |x| x.name.to_sym == :filters }
          when 'sidebar'
            available_sidebar_sections
          end
        end

      end

    end

  end

end
