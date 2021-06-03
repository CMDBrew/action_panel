module ActiveAdmin

  module Inputs

    module Filters

      # Select2Input Filter
      class Select2Input < ActiveAdmin::Inputs::Filters::SelectInput

        def input_html_options
          klass = super[:class]
          super.merge(class: [klass, 'select2'].reject(&:blank?).join(' '))
        end

      end

    end

  end

end
