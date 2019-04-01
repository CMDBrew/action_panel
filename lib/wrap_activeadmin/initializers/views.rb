module WrapActiveAdmin

  module Initializers

    # Views Initializers
    module Views

      COMPONENT_FILES = %w[
        dropdown_menu site_title menu menu_item table_for attributes_table panel
        blank_slate paginated_collection scopes index_list tabs
      ].freeze
      VIEW_FILES = %w[header title_bar action_items index_as_table columns].freeze
      PAGE_FILES = %w[base page index form].freeze

      include Base
      extend ActiveSupport::Concern

      included do
        initializer 'view overrides' do |_app|
          require_each(COMPONENT_FILES, path: 'views/components')
          require_each(VIEW_FILES, path: 'views')
          require_each(PAGE_FILES, path: 'views/pages')
        end
      end

    end

  end

end
