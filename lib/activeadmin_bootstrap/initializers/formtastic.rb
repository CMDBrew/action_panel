module ActiveAdminBootstrap

  module Initializers

    # Formtastic Initializers
    module Formtastic

      BASE_FILES   = %w[wrapping html choices].freeze
      INPUTS_FILES = %w[
        select_input select2_input check_boxes_input radio_input
        boolean_input switch_input file_input color_picker_input
        date_picker_input just_datetime_picker_input hstore_input
        rich_text_area_input password_input
      ].freeze

      include Base
      extend ActiveSupport::Concern

      included do
        initializer 'formtastic.overrides' do |_app|
          require_each(BASE_FILES, path: 'formtastic/base')
          require_each(INPUTS_FILES, path: 'formtastic/inputs')
        end
      end

    end

  end

end
