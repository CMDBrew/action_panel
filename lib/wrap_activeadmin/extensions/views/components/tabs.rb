module ActiveAdmin

  module Views

    # ROverwrite Tabs - activeadmin/lib/active_admin/views/components/tabs.rb
    class Tabs < ActiveAdmin::Component

      def build(options = {}, &_block)
        klass  = options.delete(:class) { WrapActiveAdmin::TAB_CLASS }
        @ctrls = div class: 'tab-ctrls'
        @menu  = ul(class: klass, role: 'tablist')
        @tabs_content = div(class: 'tab-content')
        @ctrls << @menu
      end

      def build_menu_item(title, options, &_block)
        fragment = options.fetch(:id, title.parameterize)
        html_options = options.fetch(:html_options, {})
        li html_options.merge(class: 'nav-item') do
          link_to title, "##{fragment}", class: 'nav-link'
        end
      end

    end

  end

end
