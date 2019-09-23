module ActiveAdminBootstrap

  module Initializers

    # Others Initializers
    module Others

      FILES = %w[resource page form_builder view_helpers].freeze

      include Base
      extend ActiveSupport::Concern

      included do
        config.before_configuration do |_app|
          require_each(%w[namespace_settings])
        end

        initializer 'others.overrides' do |_app|
          require_each(FILES)
        end
      end

    end

  end

end
