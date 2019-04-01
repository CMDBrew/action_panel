module WrapActiveAdmin

  module Initializers

    # Others Initializers
    module Others

      FILES = %w[resource form_builder view_helpers].freeze

      include Base
      extend ActiveSupport::Concern

      included do
        initializer 'others overrides' do |_app|
          require_each(FILES)
        end
      end

    end

  end

end
