module Formtastic

  module Inputs

    # Overwrite DatePickerInput - formtastic/lib/formtastic/inputs/date_picker_input.rb
    class DatePickerInput

      def html_input_type
        'text'
      end

      def input_html_options
        super.merge(class: 'form-control datepicker', autocomplete: 'off')
      end

    end

  end

end
