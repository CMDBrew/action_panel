module WrapActiveadmin

  module Generators

    # Copy Scss variables
    class StylesGenerator < Rails::Generators::Base

      desc 'Copy WrapActiveAdmin styles'
      source_root(
        File.expand_path('../../../../app/assets/stylesheets/wrap_activeadmin/meta', __dir__)
      )

      def setup_directory
        empty_directory 'app/assets/stylesheets/wrap_activeadmin_overrides'
      end

      def copy_vars
        template(
          '_bootstrap_vars.scss',
          'app/assets/stylesheets/wrap_activeadmin_overrides/_bootstrap_vars.scss'
        )
        template(
          '_vars.scss',
          'app/assets/stylesheets/wrap_activeadmin_overrides/_vars.scss'
        )
      end

      def setup_imports
        inject_into_file 'app/assets/stylesheets/active_admin.scss',
                         "\n@import \"wrap_activeadmin_overrides/**/*\";",
                         after: %r{// Active Admin's got SASS!}
      end

    end

  end

end
