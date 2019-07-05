module WrapActiveAdmin

  # Initialize Engine
  class Engine < ::Rails::Engine

    isolate_namespace WrapActiveAdmin

    config.generators do |g|
      g.test_framework :rspec
    end

    # Initialize Initializers
    include WrapActiveAdmin::Initializers::Formtastic
    include WrapActiveAdmin::Initializers::Inputs
    include WrapActiveAdmin::Initializers::BatchActions
    include WrapActiveAdmin::Initializers::Resource
    include WrapActiveAdmin::Initializers::Views
    include WrapActiveAdmin::Initializers::ViewHelpers
    include WrapActiveAdmin::Initializers::Orm
    include WrapActiveAdmin::Initializers::Others

    # Change default configs for ActiveAdmin
    config.before_initialize do
      ActiveAdmin.setup do |config|
        config.current_filters = false
        config.comments_menu   = false
        config.comments_order  = 'created_at DESC'
        config.meta_tags = {
          viewport: 'width=device-width, height=device-height, initial-scale=1.0, user-scalable=no'
        }
      end
    end

  end

end
