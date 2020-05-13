module ActiveAdmin

  module Views

    module Pages

      # Overwrite Pages::Base - activeadmin/lib/active_admin/views/pages/base.rb
      class Base < Arbre::HTML::Document

        def build(*_args)
          set_attribute :lang, I18n.locale
          build_active_admin_head
          build_webpackers
          build_page
        end

        private

        def build_webpackers
          path = Rails.root.join('app', 'javascript', 'packs', 'active_admin.js')
          return unless ActiveAdminBootstrap.rails6? && File.exist?(path)

          within head do
            text_node(javascript_pack_tag('active_admin'))
          end
        end

        # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
        def build_page
          within body(class: body_classes) do
            header active_admin_namespace, current_menu
            div id: 'titlebar-wrapper' do
              title_bar title, action_items_for_action
            end

            build_flash_messages

            div id: 'wrapper' do
              build_unsupported_browser
              build_page_content
              build_htmls unless skip_htmls?
            end
          end
        end
        # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

        def build_page_content
          div id: 'active_admin_content' do
            contents = %i[build_body_content build_sidebar_content]
            contents.reverse! if active_admin_config.sidebar_position&.eql?('left')
            contents.each { |x| send(x) }
          end
        end

        def build_body_content
          div id: 'main', class: sidebar_class do
            div class: 'container' do
              build_main_content_wrapper
              footer active_admin_namespace
            end
          end
        end

        def build_sidebar_content
          return if skip_sidebar?

          div sidebar(sidebar_sections_for_action, class: 'container'), id: 'sidebar'
        end

        def build_htmls
          div id: 'htmls' do
            htmls_for_action.collect do |section|
              html(section)
            end
          end
        end

        def htmls_for_action
          if active_admin_config&.htmls?
            active_admin_config.htmls_for(params[:action], self)
          else
            []
          end
        end

        def skip_htmls?
          htmls_for_action.empty? || assigns[:skip_htmls] == true
        end

        def body_classes
          Arbre::HTML::ClassList.new [
            params[:action],
            params[:controller].tr('/', '_'),
            'active_admin', 'logged_in',
            active_admin_namespace.name.to_s + '_namespace'
          ]
        end

        def sidebar_class
          skip_sidebar? ? 'without_sidebar' : 'with_sidebar'
        end

        def build_flash_messages
          flash_messages.each do |type, msg|
            div msg, class: "#{ActiveAdminBootstrap::FLASH_CLASS} alert #{bs_class_for(type)}"
          end
        end

        def bs_class_for(type)
          {
            success: 'alert-success',
            error: 'alert-danger',
            alert: 'alert-warning',
            notice: 'alert-info'
          }[type.to_sym] || type.to_s
        end

      end

    end

  end

end
