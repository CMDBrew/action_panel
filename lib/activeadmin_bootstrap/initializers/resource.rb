module ActiveAdminBootstrap

  module Initializers

    # Resource Initializers
    module Resource

      FILES = %w[action_items].freeze

      include Base
      extend ActiveSupport::Concern

      included do
        initializer 'view overrides' do |_app|
          require_each(FILES, path: 'resource')
        end
      end

    end

  end

end
