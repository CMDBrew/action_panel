module ActiveAdmin

  module Views

    # Overwrite SidebarSection - lib/active_admin/sidebar_section.rb
    class SidebarSection < Panel

      builder_method :sidebar_section

      # Takes a ActiveAdmin::SidebarSection instance
      def build(section)
        @section = section
        super(@section.title, @section.options)
        add_class @section.custom_class if @section.custom_class
        self.id = @section.id
        build_sidebar_content
      end

      def default_wrapper_class
        "#{component_class(:sidebar_section, :wrapper)} panel".strip
      end

      def default_header_class
        "#{component_class(:sidebar_section, :header)} panel-header".strip
      end

      def default_body_class
        "#{component_class(:sidebar_section, :body)} panel-body".strip
      end

    end

  end

end
