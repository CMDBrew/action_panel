module ActiveAdmin

  # Overwriting FormBuilder - activeadmin/lib/active_admin/form_builder.rb
  class FormBuilder < ::Formtastic::FormBuilder

    def cancel_link(url = { action: 'index' }, html_options = {}, li_attrs = {})
      li_attrs[:class] ||= 'cancel'
      li_content =
        template.link_to(I18n.t('active_admin.cancel'),
                         url, html_options.merge(class: WrapActiveAdmin::FORM_CANCEL_CLASS))
      template.content_tag(:li, li_content, li_attrs)
    end

  end

  # Overwriting HasManyBuilder - activeadmin/lib/active_admin/form_builder.rb
  class HasManyBuilder < SimpleDelegator

    # rubocop:disable Metrics/AbcSize
    def render(&block)
      html = ''.html_safe
      html << template.content_tag(:h5) { heading } if heading.present?
      html << template.capture { content_has_many(&block) }
      html = wrap_div_or_li(html)
      template.concat(html) if template.output_buffer
      html
    end
    # rubocop:enable Metrics/AbcSize

    def render_has_many_form(form_builder, parent, &block)
      template.concat sortable_action(form_builder)
      template.concat form_fields(form_builder, parent, &block)
    end

    def form_fields(form_builder, parent)
      index = parent && form_builder.send(:parent_child_index, parent)
      template.content_tag :li, class: 'has-many-inputs' do
        template.concat(
          template.content_tag(:ol) { template.capture { yield(form_builder, index) } }
        )
        template.concat form_actions(form_builder)
      end
    end

    def form_actions(form_builder)
      template.content_tag :ol, class: 'has-many-actions' do
        template.capture { has_many_actions(form_builder, ''.html_safe) }
      end
    end

    def sortable_action(form_builder)
      return unless sortable_column

      form_builder.input sortable_column, as: :hidden
      template.content_tag(:li, class: 'handle') do
        template.waa_icon 'sortable.svg'
      end
    end

    # rubocop:disable Naming/PredicateName, Metrics/MethodLength
    def has_many_actions(form_builder, contents)
      if form_builder.object.new_record?
        contents << template.content_tag(:li) do
          template.link_to I18n.t('active_admin.has_many_remove'), '#',
                           class: 'button has_many_remove'
        end
      elsif allow_destroy?(form_builder.object)
        form_builder.input(:_destroy, as: :boolean,
                                      wrapper_html: { class: 'has_many_delete' },
                                      label: I18n.t('active_admin.has_many_delete'))
      end

      contents
    end
    # rubocop:enable Naming/PredicateName, Metrics/MethodLength

  end

end
