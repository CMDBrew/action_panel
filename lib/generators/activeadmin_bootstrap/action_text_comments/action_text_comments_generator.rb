module ActiveadminBootstrap

  module Generators

    # Change ActiveAdmin::Comment to use ActionText
    class ActionTextCommentsGenerator < Rails::Generators::Base

      include Rails::Generators::Migration

      desc 'Installs action_text for ActiveAdmin::Comment'
      source_root File.expand_path('templates', __dir__)

      def self.next_migration_number(dirname)
        next_migration_number = current_migration_number(dirname) + 1
        ActiveRecord::Migration.next_migration_number(next_migration_number)
      end

      def add_scss
        insert_into_file 'app/assets/stylesheets/active_admin.scss',
                         "// Require Webpacks\n//= require actiontext\n",
                         before: "// Active Admin's got SASS!"
      end

      def add_javascripts
        template 'active_admin.js', 'app/javascript/packs/active_admin.js'
      end

      def create_initializer
        template 'active_admin_comment_action_text.rb.erb',
                 'config/initializers/active_admin_comment_action_text.rb'
      end

      def create_migrations
        migration_template 'migrations/drop_body_for_active_admin_comments.rb.erb',
                           'db/migrate/drop_body_for_active_admin_comments.rb'
      end

    end

  end

end
