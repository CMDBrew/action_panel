module ActiveAdminBootstrap

  module Initializers

    # Formtastic Initializers
    module Formtastic

      BASE_FILES    = %w[wrapping html choices].freeze
      ACTIONS_FILES = %w[base].freeze
      INPUTS_FILES  = %w[
        select_input select2_input check_boxes_input
        boolean_input switch_input file_input color_picker_input
        date_picker_input just_datetime_picker_input
      ].freeze
      OTHER_FILES = %w[form_builder].freeze

      include Base
      extend ActiveSupport::Concern

      included do
        initializer 'base overrides' do |_app|
          require_each(BASE_FILES, path: 'formtastic/base')
          require_each(ACTIONS_FILES, path: 'formtastic/actions')
          require_each(INPUTS_FILES, path: 'formtastic/inputs')
          require_each(OTHER_FILES, path: 'formtastic')
        end
      end

    end

  end

end
