module Formtastic

  module Inputs

    # TODO: add direct upload support
    # Overwrite Formastic Default FileInput - formtastic/lib/formtastic/inputs/file_input.rb
    class FileInput

      include Base

      def to_html
        input_wrapping do
          label_html << file_html
        end
      end

      def file_html
        template.content_tag :div, class: 'custom-file-input-group' do
          file_preview + file_input
        end
      end

      private

      def file_preview
        template.content_tag(:div, class: 'custom-file-preview') do
          previewable? && template.image_tag(object.send(options[:preview]))
        end
      end

      def previewable?
        options[:preview] && object.try(options[:preview]) && file_field_valid?
      end

      def file_field_valid?
        object.valid?
        object.errors[method].blank?
      end

      def file_input
        template.content_tag(:div, class: 'input-group') do
          template.content_tag(:div, class: 'custom-file') do
            builder.file_field(method, input_html_options) +
              template.content_tag(:label, i18n_label,
                                   class: 'custom-file-label', for: input_html_options[:id])
          end
        end
      end

      def i18n_label
        ::I18n.t('action_panel.formtastic.custom_file.upload')
      end

      def input_html_options
        super.merge(class: 'custom-file-input')
      end

    end

  end

end
