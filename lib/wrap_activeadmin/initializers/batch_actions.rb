module WrapActiveAdmin

  module Initializers

    # BatchActions Initializers
    module BatchActions

      FILES = %w[controller resource_extension].freeze
      VIEW_FILES = %w[batch_action_selector].freeze

      include Base
      extend ActiveSupport::Concern

      included do
        ActiveAdmin.before_load do |_app|
          require_each(FILES, path: 'batch_actions')
          require_each(VIEW_FILES, path: 'batch_actions/views')
        end
      end

    end

  end

end
