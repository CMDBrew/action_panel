module Formtastic

  module Inputs

    # Overwrite CheckBoxesInput - formtastic/lib/formtastic/inputs/check_boxes_input.rb
    class CheckBoxesInput

      def choice_html(choice)
        template.content_tag(:div, class: 'form-check') do
          checkbox_input(choice) +
            template.content_tag(
              :label, choice_label(choice),
              label_html_options.merge(for: choice_input_dom_id(choice), class: 'form-check-label')
            )
        end
      end

      private

      def extra_html_options(choice)
        input_html_options.merge(custom_choice_html_options(choice)).merge(class: 'form-check-input')
      end

    end

  end

end
