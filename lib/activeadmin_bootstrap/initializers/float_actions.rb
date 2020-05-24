module ActiveAdminBootstrap

  module Initializers

    # FloatActions Initializers
    module FloatActions

      DSL_FILES = %w[float_actions].freeze
      RESOURCE_FILES = %w[float_actions].freeze
      VIEW_FILES = %w[float_actions].freeze
      OTHER_FILES = %w[float_action].freeze

      include Base
      extend ActiveSupport::Concern

      included do
        initializer 'require.float_action.files' do |_app|
          require_each(DSL_FILES, path: 'dsl')
          require_each(RESOURCE_FILES, path: 'resource')
          require_each(VIEW_FILES, path: 'views')
          require_each(OTHER_FILES)
        end

        initializer 'initialize.float_action.resource' do |_app|
          ::ActiveAdmin::Resource.send(:include, ActiveAdmin::Resource::FloatActions)
        end

        initializer 'initialize.float_action.page' do |_app|
          ::ActiveAdmin::Page.send(:include, ActiveAdmin::Resource::FloatActions)
        end

        initializer 'initialize.float_action.dsl' do |_app|
          ::ActiveAdmin::DSL.send(:include, ActiveAdmin::FloatActions::DSL)
        end
      end

    end

  end

end
