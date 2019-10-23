module Formtastic

  module Inputs

    # Overwrite SelectInput - formtastic/lib/formtastic/inputs/select_input.rb
    class SelectInput

      def select_html
        builder.select(input_name, collection, input_options,
                       input_html_options.reverse_merge(class: 'custom-select'))
      end

    end

  end

end
