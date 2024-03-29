module ActiveAdmin

  module Views

    # Overwrite Panel - activeadmin/lib/active_admin/views/components/panel.rb
    class Panel < ActiveAdmin::Component

      include ActionPanel::ConfigsFinder

      def build(title = nil, attributes = {})
        header_class = attributes[:header_class]
        body_class   = attributes[:body_class]
        super(attributes)
        add_class default_wrapper_class

        @title    = div(build_title(title), class: "#{default_header_class} #{header_class}".strip)
        @contents = div(class: "#{default_body_class} #{body_class}".strip)
      end

      def header_action(*args)
        action = args[0]

        @title << div(class: 'actions') do
          html = []
          html << action
          html << yield if block_given?
          safe_join(html)
        end
      end

      def build_title(title)
        return if title.blank?

        div h5(title.to_s), class: 'title'
      end

      def default_wrapper_class
        "#{component_class(:panel, :wrapper)} panel".strip
      end

      def default_header_class
        "#{component_class(:panel, :header)} panel-header".strip
      end

      def default_body_class
        "#{component_class(:panel, :body)} panel-body".strip
      end

    end

  end

end
