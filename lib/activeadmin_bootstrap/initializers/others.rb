module ActiveAdminBootstrap

  module Initializers

    # Others Initializers
    module Others

      FILES = %w[resource page form_builder view_helpers base_controller].freeze

      include Base
      extend ActiveSupport::Concern

      included do
        config.before_configuration do |_app|
          require_each(%w[dynamic_settings_node namespace_settings])
        end

        initializer 'others.overrides' do |_app|
          require_each(FILES)
        end
      end

    end

  end

end
