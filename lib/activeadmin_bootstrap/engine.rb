module ActiveAdminBootstrap

  # Initialize Engine
  class Engine < ::Rails::Engine

    isolate_namespace ActiveAdminBootstrap

    config.generators do |g|
      g.test_framework :rspec
    end

    # Initialize Initializers
    include ActiveAdminBootstrap::Initializers::Formtastic
    include ActiveAdminBootstrap::Initializers::Inputs
    include ActiveAdminBootstrap::Initializers::BatchActions
    include ActiveAdminBootstrap::Initializers::IndexAsCalendar
    include ActiveAdminBootstrap::Initializers::Html
    include ActiveAdminBootstrap::Initializers::Resource
    include ActiveAdminBootstrap::Initializers::Views
    include ActiveAdminBootstrap::Initializers::ViewHelpers
    include ActiveAdminBootstrap::Initializers::Orm
    include ActiveAdminBootstrap::Initializers::Others

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
      app.config.assets.precompile += %w[activeadmin_bootstrap/placeholders/color_brick.png]
    end

  end

end
