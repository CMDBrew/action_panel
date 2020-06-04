module Formtastic

  module Inputs

    # ActionText Rich Text Area Input
    class RichTextAreaInput < ::Formtastic::Inputs::TextInput

      def input_html_options
        {
          cols: builder.default_text_area_width,
          rows: builder.default_text_area_height
        }.merge(super).merge(class: 'trix-content')
      end

      def to_html
        input_wrapping do
          label_html <<
            builder.rich_text_area(method, input_html_options)
        end
      end

    end

  end

end
