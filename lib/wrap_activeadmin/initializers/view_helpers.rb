module WrapActiveAdmin

  module Initializers

    # ViewHelpers Initializers
    module ViewHelpers

      FILES = %w[base notice menu].freeze

      include Base
      extend ActiveSupport::Concern

      included do
        initializer 'view_helpers overrides' do |_app|
          require_each(FILES, path: 'view_helpers')
        end
      end

    end

  end

end
