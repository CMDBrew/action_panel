module ActiveAdmin

  module Htmls

    # Register in ActiveAdmin::DSL - activeadmin/lib/active_admin/dsl.rb
    module DSL

      def html(name, options = {}, &block)
        config.htmls << ActiveAdmin::Html.new(name, options, &block)
      end

    end

  end

end
