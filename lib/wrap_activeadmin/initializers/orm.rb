module WrapActiveAdmin

  module Initializers

    # Orm Initializers
    module Orm

      FILES = %w[active_admin_comments].freeze

      include Base
      extend ActiveSupport::Concern

      included do
        initializer 'others overrides' do |_app|
          require_each(FILES, path: 'orm/active_record/comments/views')
        end
      end

    end

  end

end
