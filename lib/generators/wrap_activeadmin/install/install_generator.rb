module WrapActiveadmin

  module Generators

    # Install Gem
    class InstallGenerator < Rails::Generators::Base

      desc 'Installs WrapActiveAdmin'
      source_root File.expand_path('templates', __dir__)

      def replace_assets
        gsub_file(
          'app/assets/javascripts/active_admin.js.coffee',
          'active_admin/',
          'wrap_activeadmin/'
        )
        gsub_file(
          'app/assets/stylesheets/active_admin.scss',
          'active_admin/',
          'wrap_activeadmin/'
        )
      end

      def create_initializers
        template(
          'wrap_activeadmin.rb.erb',
          'config/initializers/wrap_activeadmin.rb'
        )
      end

    end

  end

end
