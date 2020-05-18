module ActiveAdminBootstrap

  module Initializers

    # Views Initializers
    module Views

      COMPONENT_FILES = %w[
        status_tag active_admin_form dropdown_menu site_title menu menu_item table_for
        attributes_table panel sidebar_section paginated_collection scopes index_list
        tabs blank_slate
      ].freeze
      VIEW_FILES = %w[header title_bar action_items index_as_table columns footer].freeze
      PAGE_FILES = %w[base page index form].freeze

      include Base
      extend ActiveSupport::Concern

      included do
        initializer 'views.overrides' do |_app|
          require_each(COMPONENT_FILES, path: 'views/components')
          require_each(VIEW_FILES, path: 'views')
          require_each(PAGE_FILES, path: 'views/pages')
        end
      end

    end

  end

end
