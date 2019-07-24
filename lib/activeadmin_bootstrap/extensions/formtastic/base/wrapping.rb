module Formtastic

  module Inputs

    module Base

      # Overwriting Wrapping - formtastic/lib/formtastic/inputs/base/wrapping.rb
      module Wrapping

        def wrapper_classes
          classes = wrapper_classes_raw
          classes << as
          classes << 'input form-group'
          classes << 'error' if errors?
          classes << 'optional' if optional?
          classes << 'required' if required?
          classes << 'autofocus' if autofocus?

          classes.join(' ')
        end

      end

    end

  end

end
