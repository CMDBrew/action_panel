module Formtastic

  module Inputs

    # Overwrite RadioInput - formtastic/lib/formtastic/inputs/radio_input.rb
    class RadioInput

      def choice_html(choice)
        template.content_tag(:div, class: 'form-check') do
          radio_html(choice) + label_html(choice)
        end
      end

      private

      def label_html(choice)
        template.content_tag(
          :label,
          choice_label(choice),
          label_html_options.merge(for: choice_input_dom_id(choice),
                                   class: 'form-check-label')
        )
      end

      def radio_html(choice)
        builder.radio_button(
          input_name,
          choice_value(choice),
          input_html_options.merge(choice_html_options(choice)).
            merge(required: false, class: 'form-check-input')
        )
      end

      def choice_label(choice)
        checkbox_icon + super(choice)
      end

      def checkbox_icon
        template.content_tag(:i, '', class: 'checkbox-icon')
      end

    end

  end

end
