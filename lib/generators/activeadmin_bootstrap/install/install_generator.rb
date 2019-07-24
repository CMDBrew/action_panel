module WrapActiveadmin

  module Generators

    # Install Gem
    class InstallGenerator < Rails::Generators::Base

      desc 'Installs ActiveAdminBootstrap'
      source_root File.expand_path('templates', __dir__)

      def replace_assets
        gsub_file(
          'app/assets/javascripts/active_admin.js.coffee',
          'active_admin/',
          'activeadmin_bootstrap/'
        )
        gsub_file(
          'app/assets/stylesheets/active_admin.scss',
          'active_admin/',
          'activeadmin_bootstrap/'
        )
      end

      def create_initializers
        template(
          'activeadmin_bootstrap.rb.erb',
          'config/initializers/activeadmin_bootstrap.rb'
        )
      end

    end

  end

end
