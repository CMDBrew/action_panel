module ActionPanel

  # Initialize Engine
  class Engine < ::Rails::Engine

    isolate_namespace ActionPanel

    config.generators do |g|
      g.test_framework :rspec
    end

    # Initialize Initializers
    include Initializers::Formtastic
    include Initializers::Inputs
    include Initializers::BatchActions
    include Initializers::IndexAsCalendar
    include Initializers::Html
    include Initializers::FloatActions
    include Initializers::Resource
    include Initializers::Views
    include Initializers::ViewHelpers
    include Initializers::Orm
    include Initializers::Others

    # Change default configs for ActiveAdmin
    config.before_initialize do
      ActiveAdmin.setup do |config|
        config.current_filters = false
        config.comments_menu = false
        config.comments_order = 'created_at DESC'
        config.meta_tags = {
          viewport: 'width=device-width, height=device-height, initial-scale=1.0, user-scalable=no'
        }
      end
    end

    initializer 'assets precompile' do |app|
      app.config.assets.precompile += %w[action_panel/placeholders/color_brick.png]
    end

  end

end
