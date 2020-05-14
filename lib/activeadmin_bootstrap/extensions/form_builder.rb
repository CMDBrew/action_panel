module ActiveAdmin

  # Overwrite HasManyBuilder - activeadmin/lib/active_admin/form_builder.rb
  class HasManyBuilder < SimpleDelegator

    include ActiveAdminBootstrap::ConfigsFinder

    def initialize(has_many_form, assoc, options)
      super has_many_form
      @assoc = assoc
      @options = extract_custom_settings!(options.dup)
      @options.reverse_merge!(for: assoc)
      @options[:class] =
        [options[:class], "inputs has_many_fields #{item_class}"].compact.join(' ')

      @options[:for] = [assoc, sorted_children(sortable_column)] if sortable_column
    end

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
      template.content_tag(:li, '', class: 'handle')
    end

    # rubocop:disable all
    def has_many_actions(form_builder, contents)
      if form_builder.object.new_record?
        contents << template.content_tag(:li) do
          template.link_to I18n.t('active_admin.has_many_remove'), '#',
                           class: "button has_many_remove #{destroy_class}"
        end
      elsif allow_destroy?(form_builder.object)
        form_builder.input(
          :_destroy,
          as: :boolean,
          wrapper_html: { class: "button has_many_delete #{destroy_class}" },
          label: I18n.t('active_admin.has_many_delete')
        )
      end

      contents
    end

    # Capture the ADD JS
    def js_for_has_many(class_string, &form_block)
      assoc_name  = assoc_klass.model_name
      placeholder = "NEW_#{assoc_name.to_s.underscore.upcase.gsub(/\//, '_')}_RECORD"
      opts = {
        for: [assoc, assoc_klass.new],
        class: class_string,
        for_options: { child_index: placeholder }
      }
      html = template.capture { __getobj__.send(:inputs_for_nested_attributes, opts, &form_block) }
      text = new_record.is_a?(String) ? new_record : I18n.t('active_admin.has_many_new', model: assoc_name.human)

      template.link_to text, '#', class: "button has_many_add #{new_class}", data: {
        html: CGI.escapeHTML(html).html_safe, placeholder: placeholder
      }
    end
    # rubocop:enable all

    private

    def new_class
      @new_class ||= component_class(:form, :has_many, :new)
    end

    def destroy_class
      @destroy_class ||= component_class(:form, :has_many, :destroy)
    end

    def item_class
      @item_class ||= component_class(:form, :has_many, :item)
    end

    def active_admin_config
      @active_admin_config ||= template.active_admin_config
    end

  end

end
