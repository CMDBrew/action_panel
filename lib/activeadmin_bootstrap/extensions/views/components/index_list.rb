module ActiveAdmin

  module Views

    # Overwrite IndexList - activeadmin/lib/active_admin/views/components/index_list.rb
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

        name = index_class.index_name
        a href: url_with_params, class: classes_for_link(index_class), title: name do
          span I18n.t("active_admin.index_list.#{name}", default: name.to_s.titleize)
        end
      end

      def classes_for_link(index_class)
        name = index_class.index_name

        if current_index?(index_class)
          "table_tools_button index-as-#{name} #{ActiveAdminBootstrap::TABLE_TOOLS_BTN_ACTIVE_CLASS}"
        else
          "table_tools_button index-as-#{name} #{ActiveAdminBootstrap::TABLE_TOOLS_BTN_CLASS}"
        end
      end

    end

  end

end
