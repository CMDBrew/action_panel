module ActiveAdminBootstrap

  module Initializers

    # IndexAsCalendar Initializers
    module IndexAsCalendar

      DSL_FILES  = %w[index_as_calendar].freeze
      VIEW_FILES = %w[index_as_calendar].freeze

      include Base
      extend ActiveSupport::Concern

      included do
        initializer 'require.index_as_calendar.files' do |_app|
          require_each(DSL_FILES, path: 'dsl')
          require_each(VIEW_FILES, path: 'views')
        end

        initializer 'initialize DSL' do |_app|
          ::ActiveAdmin::DSL.send(:include, ActiveAdmin::IndexAsCalendar::DSL)
        end
      end

    end

  end

end
