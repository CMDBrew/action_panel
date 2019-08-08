module ActiveAdmin

  module Comments

    module Views

      # Overwrite ActiveAdmin Comments
      # - lib/active_admin/orm/active_record/comments/views/active_admin_comments.rb
      class Comments < ActiveAdmin::Views::Panel

        protected

        # rubocop:disable Rails/OutputSafety
        def build_comments
          build_comment_form

          if @comments.any?
            @comments.each(&method(:build_comment))
            div class: 'paginating-footer' do
              div page_entries_info(@comments).html_safe, class: 'pagination_information'
              text_node paginate @comments, theme: 'active_admin'
            end
          else
            build_empty_message
          end
        end
        # rubocop:enable Rails/OutputSafety

        # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
        def build_comment(comment)
          div for: comment do
            div class: 'active_admin_comment_meta row' do
              strong class: 'active_admin_comment_author col' do
                if comment.author
                  auto_link(comment.author)
                else
                  I18n.t('active_admin.comments.author_missing')
                end
              end

              div class: 'col-auto d-flex flex-row align-items-center' do
                small pretty_format(comment.created_at), class: 'comment-date'
                comment_actions(comment)
              end
            end

            div class: 'active_admin_comment_body' do
              simple_format comment.body, {}, wrapper_tag: 'div', class: 'trix-content'
            end
          end
        end
        # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

        def comment_actions(comment)
          return unless authorized?(ActiveAdmin::Auth::DESTROY, comment)

          div class: 'comment-actions' do
            dropdown_menu aa_icon('menu.svg'),
                          button: { class: 'btn-sm no-caret' },
                          menu: { class: 'dropdown-menu-right' } do
              comment_action_delete(comment)
            end
          end
        end

        def comment_action_delete(comment)
          item(
            I18n.t('active_admin.comments.delete'), comments_url(comment.id),
            method: :delete, class: 'comment-delete',
            data: {
              confirm: I18n.t('active_admin.comments.delete_confirmation'),
              message: I18n.t('active_admin.delete_message')
            }
          )
        end

        # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
        def build_comment_form
          return unless authorized?(ActiveAdmin::Auth::CREATE, ActiveAdmin::Comment)

          active_admin_form_for(ActiveAdmin::Comment.new, url: comment_form_url) do |f|
            f.inputs do
              f.input :resource_type,
                      as: :hidden,
                      input_html: { value: ActiveAdmin::Comment.resource_type(parent.resource) }
              f.input :resource_id, as: :hidden, input_html: { value: parent.resource.id }

              input_type =
                active_admin_config&.namespace&.trix_active_admin_comments ? 'trix_editor' : 'text'
              f.input :body, as: input_type.to_sym, label: false, input_html: { rows: '4' }
            end
            f.actions do
              f.action :submit, label: I18n.t('active_admin.comments.add')
            end
          end
        end
        # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

      end

    end

  end

end
