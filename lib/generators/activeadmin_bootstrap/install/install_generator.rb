module ActiveadminBootstrap

  module Generators

    # Install Gem
    class InstallGenerator < Rails::Generators::Base

      desc 'Installs ActiveAdminBootstrap and generates the necessary migrations'
      argument :name, type: :string, default: 'material'

      source_root File.expand_path('templates', __dir__)

      def replace_assets
        if name.present?
          generate 'activeadmin_bootstrap:theme', name
        else
          template 'active_admin.js', 'app/assets/javascripts/active_admin.js'
          template 'active_admin.scss', 'app/assets/stylesheets/active_admin.scss'
          template 'activeadmin_bootstrap.rb.erb', 'config/initializers/activeadmin_bootstrap.rb'
        end
      end

    end

  end

end
