module ActiveAdmin

  module Views

    # Overwrite BlankSlate - activeadmin/lib/active_admin/views/components/blank_slate.rb
    class BlankSlate < ActiveAdmin::Component

      def default_class_name
        'blank_slate_container card'
      end

      # rubocop:disable Rails/OutputSafety
      def build(content)
        super(span(content.html_safe, class: 'blank_slate card-body'))
      end
      # rubocop:enable Rails/OutputSafety

    end

  end

end
