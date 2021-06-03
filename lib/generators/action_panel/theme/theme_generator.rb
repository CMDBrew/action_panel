module ActionPanel

  module Generators

    # Install Theme
    class ThemeGenerator < Rails::Generators::Base

      desc 'Installs theme for ActionPanel'
      source_root File.expand_path('templates', __dir__)

      argument :name, type: :string

      def replace_assets
        template "#{name}/active_admin.js", 'app/assets/javascripts/active_admin.js'
        template "#{name}/active_admin.scss", 'app/assets/stylesheets/active_admin.scss'
      end

      def create_initializers
        template "#{name}/action_panel.rb.erb", 'config/initializers/action_panel.rb'
      end

    end

  end

end
