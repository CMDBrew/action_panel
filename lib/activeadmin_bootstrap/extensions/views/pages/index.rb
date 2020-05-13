module ActiveAdmin

  module Views

    module Pages

      # Overwrite Views::Pages::Index - activeadmin/lib/active_admin/views/pages/index.rb
      class Index < Base

        FILTER_OPTS = %w[sidebar main].freeze

        def main_content
          unless FILTER_OPTS.include?(active_admin_config.filter_position)
            raise "Invalid filter_position. Available options are: #{FILTER_OPTS.join(', ')}"
          end

          build_filters
          build_table_tools
          wrap_with_batch_action_form do
            build_collection
          end
        end

        def build_page_content
          super
        end

        def build_table_tools
          return unless any_table_tools?

          div class: 'table_tools' do
            div build_scopes, class: 'mb-3 tab-ctrls'
            div class: 'scope_ctrls' do
              build_batch_actions_selector
              build_index_list
              build_filter_toggler
            end
          end
        end

        private

        def build_filters
          return unless active_admin_config.filter_position.eql?(FILTER_OPTS[1])

          div id: 'filter', class: 'collapse' do
            filter_sections.collect { |x| sidebar_section(x) }
          end
        end

        def build_filter_toggler
          return unless active_admin_config.filter_position.eql?(FILTER_OPTS[1])

          div id: 'filter-toggler' do
            a span(I18n.t('active_admin.sidebars.filters')),
              class: 'table_tool_btn', 'data-toggle': 'collapse', 'data-target': '#filter'
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
          if active_admin_config.filter_position.eql?(FILTER_OPTS[0])
            available_sidebar_sections
          else
            available_sidebar_sections.reject { |x| x.name.to_sym == :filters }
          end
        end

      end

    end

  end

end
