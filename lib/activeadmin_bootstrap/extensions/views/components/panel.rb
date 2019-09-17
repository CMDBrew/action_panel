module ActiveAdmin

  module Views

    # Overwrite Panel - activeadmin/lib/active_admin/views/components/panel.rb
    class Panel < ActiveAdmin::Component

      def build(title = nil, attributes = {})
        header_class = attributes.delete(:header_class)
        body_class   = attributes.delete(:body_class)
        super(attributes)
        add_class 'panel'
        add_class 'card'

        @title    = div(build_title(title), class: "card-header #{header_class}".strip)
        @contents = div(class: "panel_contents card-body #{body_class}".strip)
      end

      def header_action(*args)
        action = args[0]

        @title << div(class: 'header_action') do
          html = []
          html << action
          html << yield if block_given?
          safe_join(html)
        end
      end

      def build_title(title)
        return if title.blank?

        div h5(title.to_s), class: 'header-content'
      end

    end

  end

end
