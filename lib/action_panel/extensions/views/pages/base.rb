module ActiveAdmin

  module Views

    module Pages

      # Overwrite Pages::Base - activeadmin/lib/active_admin/views/pages/base.rb
      class Base < Arbre::HTML::Document

        include ActionPanel::ConfigsFinder

        SIDEBAR_OPTS = %w[left right].freeze

        def build(*_args)
          unless SIDEBAR_OPTS.include?(active_admin_config.sidebar_position)
            raise "Invalid sidebar_position. Available options are: #{SIDEBAR_OPTS.join(', ')}"
          end

          set_attribute :lang, I18n.locale
          build_active_admin_head
          build_webpackers
          build_page
          build_breakpoint_helpers
        end

        private

        def build_breakpoint_helpers
          div id: 'breakpoint-helpers' do
            span class: 'breakpoint-up-helper'
            span class: 'breakpoint-down-helper'
          end
        end

        def build_webpackers
          path = Rails.root.join('app', 'javascript', 'packs', 'active_admin.js')
          return unless ActionPanel.rails6? && File.exist?(path)

          within head do
            text_node(javascript_pack_tag('active_admin'))
          end
        end

        def build_page
          within body(class: body_classes) do
            header(active_admin_namespace, current_menu)
            title_bar(active_admin_namespace, title, action_items_for_action)

            div id: 'wrapper' do
              build_flash_messages
              build_unsupported_browser
              build_page_content
              build_extra_components
            end
          end
        end

        def build_extra_components
          div id: 'bottom-nav' do
            float_actions(float_actions_for_action) unless skip_float_actions?
          end

          htmls(htmls_for_action) unless skip_htmls?
        end

        def build_page_content
          div id: 'active_admin_content' do
            contents = %i[build_body_content build_sidebar_content]
            contents.reverse! if active_admin_config.sidebar_position&.eql?(SIDEBAR_OPTS[0])
            contents.each { |x| send(x) }
          end
        end

        def build_body_content
          div id: 'main', class: sidebar_class do
            div class: content_wrapper_class do
              build_main_content_wrapper
              footer active_admin_namespace
            end
          end
        end

        def build_sidebar_content
          return if skip_sidebar?

          div sidebar(sidebar_sections_for_action, class: 'container'), id: 'sidebar'
        end

        def htmls_for_action
          if active_admin_config&.htmls?
            active_admin_config.htmls_for(params[:action], self)
          else []
          end
        end

        def float_actions_for_action
          if active_admin_config&.float_actions?
            active_admin_config.float_actions_for(params[:action], self)
          else []
          end
        end

        def skip_htmls?
          htmls_for_action.empty? || assigns[:skip_htmls] == true
        end

        def skip_float_actions?
          float_actions_for_action.empty? || assigns[:skip_float_actions] == true
        end

        def body_classes
          Arbre::HTML::ClassList.new [
            params[:action],
            params[:controller].tr('/', '_'),
            'active_admin', 'logged_in',
            active_admin_namespace.name.to_s + '_namespace',
            active_admin_config.body_class,
            "layout-navigation-#{active_admin_config.navigation}",
            sidebar_class
          ]
        end

        def sidebar_class
          skip_sidebar? ? 'without_sidebar' : 'with_sidebar'
        end

        def build_flash_messages
          return if flash_messages.blank?

          div class: 'flashes' do
            flash_messages.each do |type, msg|
              div msg, class: "flash #{default_class} #{flash_class(type)}".strip
            end
          end
        end

        def default_class
          @default_class ||= component_class(:flash, :default)
        end

        def flash_class(type)
          @flash_class ||= component_class(:flash, type.to_sym)
        end

        def content_wrapper_class
          klass =
            case self.class.to_s
            when 'ActiveAdmin::Views::Pages::Index'
              component_class(:content_wrapper, :index)
            when 'ActiveAdmin::Views::Pages::Form'
              component_class(:content_wrapper, :form)
            when 'ActiveAdmin::Views::Pages::Show'
              component_class(:content_wrapper, :show)
            end
          klass || 'container'
        end

      end

    end

  end

end
