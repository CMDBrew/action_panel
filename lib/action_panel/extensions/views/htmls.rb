module ActiveAdmin

  module Views

    # Register Htmls in Views
    class Htmls < ActiveAdmin::Component

      builder_method :htmls

      def build(htmls)
        htmls.each do |html|
          div instance_exec(&html.block), class: 'html-section'
        end
      end

      # Renders attributes_table_for current resource
      def attributes_table(*args, &block)
        attributes_table_for resource, *args, &block
      end

    end

  end

end
