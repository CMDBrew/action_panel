module Formtastic

  module Inputs

    # Overwrite BooleanInput - formtastic/lib/formtastic/inputs/boolean_input.rb
    class BooleanInput

      def to_html
        input_wrapping do
          template.content_tag :div, class: 'form-check' do
            hidden_field_html +
              check_box_html +
              label_html
          end
        end
      end

      private

      def label_html
        builder.label(
          method,
          checkbox_icon + label_span,
          label_html_options
        )
      end

      def checkbox_icon
        template.content_tag(:i, '', class: 'checkbox-icon')
      end

      def label_span
        template.content_tag(:span, label_text)
      end

      def label_html_options
        {
          for: input_html_options[:id],
          class: super[:class] - ['label'] + ['form-check-label']
        }
      end

      def input_html_options
        {
          name: input_html_options_name,
          class: 'form-check-input'
        }.reverse_merge!(super)
      end

    end

  end

end
