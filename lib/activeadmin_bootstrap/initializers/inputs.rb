module ActiveAdminBootstrap

  module Initializers

    # Inputs Initializers
    module Inputs

      BASE_FILES  = %w[search_method_select].freeze
      OTHER_FILES = %w[form date_range_input select2_input].freeze

      include Base
      extend ActiveSupport::Concern

      included do
        initializer 'inputs.overrides' do |_app|
          require_each(BASE_FILES, path: 'inputs/filters/base')
          require_each(OTHER_FILES, path: 'inputs/filters')
        end
      end

    end

  end

end
