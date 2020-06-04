module ActionPanel

  module Initializers

    # Resource Initializers
    module Resource

      FILES = %w[action_items menu_item].freeze

      include Base
      extend ActiveSupport::Concern

      included do
        initializer 'resources.overrides' do |_app|
          require_each(FILES, path: 'resource')
        end
      end

    end

  end

end
