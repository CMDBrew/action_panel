module ActiveAdmin

  class Resource

    # Register Htmls Resource
    module Htmls

      def htmls
        @htmls ||= []
      end

      def clear_htmls!
        @htmls = []
      end

      def htmls_for(action, render_context = nil)
        htmls.select do |section|
          section.display_on?(action, render_context)
        end.sort_by(&:priority)
      end

      def htmls?
        @htmls&.any?
      end

    end

  end

end
