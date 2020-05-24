module Formtastic

  module Inputs

    # Overwrite SelectInput - formtastic/lib/formtastic/inputs/select_input.rb
    class SelectInput

      def input_html_options
        extra_input_html_options.merge(super.reject { |k, v| k == :name && v.nil? }).
          merge(class: 'form-control custom-select')
      end

    end

  end

end
