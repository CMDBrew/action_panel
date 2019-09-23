module ActiveAdminBootstrap

  module Initializers

    # Orm Initializers
    module Orm

      VIEWS = %w[active_admin_comments].freeze

      include Base
      extend ActiveSupport::Concern

      included do
        initializer 'orm.overrides' do |_app|
          require_each(VIEWS, path: 'orm/active_record/comments/views')
        end
      end

    end

  end

end
