module ActiveAdmin

  module Inputs

    module Filters

      module Base

        # Overwrite SearchMethodSelect -
        # activeadmin/lib/active_admin/inputs/filters/base/search_method_select.rb
        module SearchMethodSelect

          def to_html
            input_wrapping do
              label_html << fields_html
            end
          end

          def fields_html
            template.content_tag :div, class: 'input-group' do
              select_html << input_html
            end
          end

          def select_html
            template.select_tag('', template.options_for_select(filter_options, current_filter),
                                class: 'custom-select')
          end

        end

      end

    end

  end

end
