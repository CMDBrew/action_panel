module Formtastic

  module Inputs

    # Overwrite Formastic Default FileInput - formtastic/lib/formtastic/inputs/file_input.rb
    class Select2Input < SelectInput

      def input_html_options
        klass = super[:class]
        super.merge(class: [klass, 'select2'].reject(&:blank?).join(' '))
      end

    end

  end

end
