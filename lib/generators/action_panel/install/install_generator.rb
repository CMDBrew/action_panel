require 'activeadmin'
require 'byebug'

module ActionPanel

  module Generators

    # Install Gem
    class InstallGenerator < Rails::Generators::Base

      desc 'Installs ActionPanel and generates the necessary migrations'

      # ActiveAdmin Options
      argument :name, type: :string, default: 'AdminUser'
      class_option :skip_users,
                   type: :boolean, default: false, desc: 'Skip installation of comments'
      class_option :skip_comments,
                   type: :boolean, default: false, desc: 'Skip installation of comments'

      # ActionPanel Options
      class_option :skip_activeadmin, type: :boolean, default: false, desc: 'Skip ActiveAdmin'
      class_option :theme, type: :string, default: 'material', desc: 'Install a specific theme'
      class_option :skip_theme, type: :boolean, default: false, desc: 'Skip theme'

      source_root File.expand_path('templates', __dir__)

      def install_activeadmin
        return if options[:skip_activeadmin]

        configs =
          options.slice('skip_comments', 'skip_namespace', 'skip_users').
          select { |_k, v| v }.map { |k, _v| "--#{k}" }
        invoke 'active_admin:install', [name], configs
      end

      def replace_assets
        if options[:skip_theme]
          template 'active_admin.js', 'app/assets/javascripts/active_admin.js'
          template 'active_admin.scss', 'app/assets/stylesheets/active_admin.scss'
          template 'action_panel.rb.erb', 'config/initializers/action_panel.rb'
        else
          generate 'action_panel:theme', options[:theme]
        end
      end

      def replace_default_admin_files
        template 'dashboard.rb.erb', 'app/admin/dashboard.rb'
        template 'admin_users.rb.erb', 'app/admin/admin_users.rb' unless options[:skip_users]
      end

    end

  end

end
