module Formtastic

  module Inputs

    # Overwriting SelectInput - formtastic/lib/formtastic/inputs/select_input.rb
    class SelectInput

      def select_html
        builder.select(input_name, collection, input_options,
                       input_html_options.merge(class: 'custom-select'))
      end

    end

  end

end
