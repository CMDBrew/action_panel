module ActiveAdmin

  module Views

    # Overwriting IndexList - activeadmin/lib/active_admin/views/components/index_list.rb
    class IndexList < ActiveAdmin::Component

      builder_method :index_list_renderer

      include ::ActiveAdmin::Helpers::Collection

      def default_class_name
        'indexes table_tools_segmented_control btn-group'
      end

      protected

      def build_index_list(index_class)
        params = request.query_parameters.except :page, :commit, :format
        url_with_params = url_for(params.merge(as: index_class.index_name.to_sym))

        a href: url_with_params, class: classes_for_link(index_class) do
          name = index_class.index_name
          I18n.t("active_admin.index_list.#{name}", default: name.to_s.titleize)
        end
      end

      def classes_for_link(index_class)
        if current_index?(index_class)
          "table_tools_button #{WrapActiveAdmin::TABLE_TOOLS_BTN_ACTIVE_CLASS}"
        else
          "table_tools_button #{WrapActiveAdmin::TABLE_TOOLS_BTN_CLASS}"
        end
      end

    end

  end

end
