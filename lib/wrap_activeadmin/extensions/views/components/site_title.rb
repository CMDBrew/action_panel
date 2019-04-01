module ActiveAdmin

  module Views

    # Overwrite Menu - activeadmin/lib/active_admin/views/components/site_title.rb
    class SiteTitle < Component

      def tag_name
        :div
      end

      def build(namespace)
        super(id: 'site_title', class: 'navbar-brand')
        @namespace = namespace

        if site_title_link?
          div site_title_with_link, class: 'site_title'
        else
          div site_title_content, class: 'site_title'
        end
      end

    end

  end

end
