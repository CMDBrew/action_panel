module ActiveAdmin

  module Views

    module Pages

      # Overwrite Pages::Base - activeadmin/lib/active_admin/views/pages/base.rb
      class Base < Arbre::HTML::Document

        private

        def build_page
          within body(class: body_classes) do
            header active_admin_namespace, current_menu
            title_bar title, action_items_for_action
            build_flash_messages

            div id: 'wrapper', class: WrapActiveAdmin::WRAPPER_CONTAINER_CLASS do
              build_unsupported_browser
              build_page_content
            end
          end
        end

        def build_page_content
          div id: 'active_admin_content' do
            contents = %i[build_body_content build_sidebar_content]
            contents.reverse! if active_admin_config.try(:sidebar_position)&.eql?('left')
            contents.each { |x| send(x) }
          end
        end

        def build_body_content
          div id: 'main-content', class: sidebar_class do
            div class: WrapActiveAdmin::CONTENT_CONTAINER_CLASS do
              build_main_content_wrapper
            end

            footer active_admin_namespace
          end
        end

        def build_sidebar_content
          return if skip_sidebar?
          div id: 'sidebar-content' do
            nav build_sidebar_toggle, class: 'navbar sidebar-header'
            sidebar(sidebar_sections_for_action,
                    id: 'sidebar', class: WrapActiveAdmin::CONTENT_CONTAINER_CLASS)
          end
        end

        def build_sidebar_toggle
          button waa_icon('close'),
                 class: 'ml-3 btn close d-xl-none',
                 'data-target': '#sidebar-content', 'data-toggle': 'collapse'
        end

        def body_classes
          Arbre::HTML::ClassList.new [
            params[:action],
            params[:controller].tr('/', '_'),
            'active_admin', 'logged_in',
            active_admin_namespace.name.to_s + '_namespace',
            "navigation-#{WrapActiveAdmin.instance_navigation}",
            sidebar_class
          ]
        end

        def sidebar_class
          skip_sidebar? ? 'without_sidebar' : 'with_sidebar'
        end

        def build_flash_messages
          flash_messages.each do |type, msg|
            div msg, class: "#{WrapActiveAdmin::FLASH_CLASS} alert #{bs_class_for(type)}"
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
