module Formtastic

  module Inputs

    # Overwriting Formastic Default FileInput - formtastic/lib/formtastic/inputs/file_input.rb
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
          if options[:preview] && object.try(options[:preview])
            template.image_tag object.send(options[:preview])
          end
        end
      end

      def file_input
        template.content_tag(:div, class: 'input-group') do
          template.content_tag(:div, class: 'custom-file') do
            builder.file_field(method, input_html_options) +
              template.content_tag(:label, ::I18n.t('wrap_active_admin.form.placeholders.file'),
                                   class: 'custom-file-label', for: input_html_options[:id])
          end
        end
      end

      def input_html_options
        super.merge(class: 'custom-file-input')
      end

    end

  end

end
