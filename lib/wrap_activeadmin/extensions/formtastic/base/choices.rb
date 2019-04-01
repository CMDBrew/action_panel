module Formtastic

  module Inputs

    module Base

      # Overwrite Choices - formtastic/lib/formtastic/inputs/base/choices.rb
      module Choices

        # rubocop:disable Rails/OutputSafety
        def legend_html
          if render_label?
            template.content_tag(:label, label_text)
          else
            ''.html_safe
          end
        end
        # rubocop:enable Rails/OutputSafety

      end

    end

  end

end
