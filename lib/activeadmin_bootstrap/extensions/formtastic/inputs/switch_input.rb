module Formtastic

  module Inputs

    # Custom SwitchInput
    class SwitchInput < BooleanInput

      def to_html
        input_wrapping do
          label_wrap do
            template.content_tag(:div, toggle_html_options) do
              hidden_field_html + check_box_html + check_box_value_html
            end
          end
        end
      end

      def label_wrap
        html = []
        html.push label_html
        html.push yield
        builder.label(input_name, template.safe_join(html), label_html_options)
      end

      def label_html
        return unless render_label?

        template.content_tag :div, label_text, class: 'label'
      end

      def check_box_value_html
        template.content_tag(:div, '', class: 'switch-btn') +
          template.content_tag(:div, class: 'form-switch-value') do
            template.content_tag(:span, checked_value_display, class: 'checked-value') +
              template.content_tag(:span, unchecked_value_display, class: 'unchecked-value')
          end
      end

      def checked_value_display
        options[:checked_value_display] ||
          ::I18n.t('activeadmin_bootstrap.form.placeholders.switch.true')
      end

      def unchecked_value_display
        options[:unchecked_value_display] ||
          ::I18n.t('activeadmin_bootstrap.form.placeholders.switch.false')
      end

      def toggle_html_options
        options[:toggle_html] ||= {}
        options[:toggle_html][:class] = "#{options[:toggle_html][:class]} form-switch".strip
        options[:toggle_html]
      end

      def label_html_options
        {
          for: input_html_options[:id],
          class: super[:class]
        }
      end

      def wrapper_classes
        classes = wrapper_classes_raw
        classes << as
        classes << 'input form-group'
        classes << 'error'     if errors?
        classes << 'optional'  if optional?
        classes << 'required'  if required?
        classes << 'autofocus' if autofocus?

        classes.join(' ')
      end

      def input_html_options
        {
          name: input_html_options_name,
          class: 'form-switch-input'
        }.reverse_merge!(super)
      end

    end

  end

end
