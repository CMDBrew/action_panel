module ActiveAdmin

  module Views

    module Pages

      # Overwriting Views::Pages::Index - activeadmin/lib/active_admin/views/pages/index.rb
      # rubocop:disable Metrics/ClassLength
      class Index < Base

        def main_content
          build_table_tools
          wrap_with_batch_action_form do
            build_collection
          end
        end

        def build_page_content
          super
          build_filter_panel
        end

        def build_table_tools
          return unless any_table_tools?

          div class: 'table_tools' do
            div build_scopes, class: 'mb-3 tab-ctrls'
            div class: 'scope_ctrls' do
              build_batch_actions_selector
              build_index_list
              build_filter_ctrl
            end
          end
        end

        protected

        # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
        def render_index
          renderer_class = find_index_renderer_class(config[:as])
          paginator = config.fetch(:paginator, true)
          download_links =
            config.fetch(:download_links, active_admin_config.namespace.download_links)
          pagination_total = config.fetch(:pagination_total, true)
          per_page = config.fetch(:per_page, active_admin_config.per_page)

          paginated_collection(collection,
                               entry_name: active_admin_config.resource_label,
                               entries_name:
                                active_admin_config.plural_resource_label(count: collection_size),
                               download_links: download_links, paginator: paginator,
                               per_page: per_page, pagination_total: pagination_total,
                               config: config) do
            div class: 'index_content' do
              insert_tag(renderer_class, config, collection)
            end
          end
        end
        # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

        private

        def build_filter_panel
          return unless active_admin_config.filter_position.eql?('slide_pane')

          div id: 'slide-pane-wrap' do
            div id: 'filters', class: 'collapse slide-pane' do
              filter_sections.collect { |x| sidebar_section(x) }
            end
            div class: 'slide-pane-backdrop backdrop',
                'data-toggle': 'collapse', 'data-target': '#filters'
          end
        end

        def build_filter_ctrl
          if active_admin_config.filter_position.eql?('table_tools')
            filter_dropdown_menu
          elsif active_admin_config.filter_position.eql?('slide_pane')
            filter_slide_pane_btn
          end
        end

        def filter_slide_pane_btn
          div class: 'ml-auto' do
            a span(I18n.t('active_admin.sidebars.filters')),
              class: 'table_tool_btn',
              'data-toggle': 'collapse', 'data-target': '#filters'
          end
        end

        def filter_dropdown_menu
          dropdown_menu I18n.t('active_admin.sidebars.filters'),
                        class: 'filter-dropdown ml-auto',
                        button: { class: 'table_tool_btn' },
                        menu: { class: 'dropdown-menu-right' } do
            filter_sections.collect { |x| item_html(sidebar_section(x)) }
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
          when 'table_tools', 'slide_pane'
            available_sidebar_sections.reject { |x| x.name.to_sym == :filters }
          else
            available_sidebar_sections
          end
        end

      end
      # rubocop:enable Metrics/ClassLength

    end

  end

end
