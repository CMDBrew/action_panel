module ActiveadminBootstrap

  module Generators

    # Copy Scss variables
    class StylesGenerator < Rails::Generators::Base

      desc 'Copy ActiveAdminBootstrap styles'
      source_root(
        File.expand_path('../../../../app/assets/stylesheets/activeadmin_bootstrap/meta', __dir__)
      )

      def setup_directory
        empty_directory 'app/assets/stylesheets/activeadmin_bootstrap'
      end

      def copy_vars
        template(
          '_bootstrap_vars.scss',
          'app/assets/stylesheets/activeadmin_bootstrap/_bootstrap_vars.scss'
        )
        template(
          '_vars.scss',
          'app/assets/stylesheets/activeadmin_bootstrap/_vars.scss'
        )
      end

      def setup_imports
        inject_into_file 'app/assets/stylesheets/active_admin.scss',
                         "\n@import \'activeadmin_bootstrap/**/*\';",
                         after: %r{// Active Admin's got SASS!}
      end

    end

  end

end
