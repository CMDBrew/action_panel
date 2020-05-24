module ActiveAdminBootstrap

  module Initializers

    # Html Initializers
    module Html

      DSL_FILES = %w[htmls].freeze
      RESOURCE_FILES = %w[htmls].freeze
      VIEW_FILES = %w[htmls].freeze
      OTHER_FILES = %w[html].freeze

      include Base
      extend ActiveSupport::Concern

      included do
        initializer 'require.html.files' do |_app|
          require_each(DSL_FILES, path: 'dsl')
          require_each(RESOURCE_FILES, path: 'resource')
          require_each(VIEW_FILES, path: 'views')
          require_each(OTHER_FILES)
        end

        initializer 'initialize.html.resource' do |_app|
          ::ActiveAdmin::Resource.send(:include, ActiveAdmin::Resource::Htmls)
        end

        initializer 'initialize.html.page' do |_app|
          ::ActiveAdmin::Page.send(:include, ActiveAdmin::Resource::Htmls)
        end

        initializer 'initialize.html.dsl' do |_app|
          ::ActiveAdmin::DSL.send(:include, ActiveAdmin::Htmls::DSL)
        end
      end

    end

  end

end
