module ActiveAdmin

  # Overwrites SidebarSection - lib/active_admin/sidebar_section.rb
  class SidebarSection

    # The title gets displayed within the section in the view
    def title
      return unless options[:title].to_s.blank? ? true : options[:title]

      I18n.t("active_admin.sidebars.#{name}", default: name.titlecase)
    end

  end

end
