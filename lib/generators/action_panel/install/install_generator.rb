module ActionPanel

  module Generators

    # Install Gem
    class InstallGenerator < Rails::Generators::Base

      desc 'Installs ActionPanel and generates the necessary migrations'
      argument :name, type: :string, default: 'material'

      source_root File.expand_path('templates', __dir__)

      def replace_assets
        if name.present?
          generate 'action_panel:theme', name
        else
          template 'active_admin.js', 'app/assets/javascripts/active_admin.js'
          template 'active_admin.scss', 'app/assets/stylesheets/active_admin.scss'
          template 'action_panel.rb.erb', 'config/initializers/action_panel.rb'
        end
      end

    end

  end

end
