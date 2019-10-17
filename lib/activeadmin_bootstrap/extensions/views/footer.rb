module ActiveAdmin

  module Views

    # Overwrite Footer - activeadmin/lib/active_admin/views/footer.rb
    class Footer < Component

      private

      def powered_by_message
        I18n.t('active_admin.powered_by',
               active_admin: link_to('Active Admin', 'https://activeadmin.info'),
               aa_version: ActiveAdmin::VERSION,
               activeadmin_bootstrap: link_to('Active Admin Bootstrap', 'https://www.cmdbrew.com'),
               aab_version: ActiveAdminBootstrap::VERSION).html_safe
      end

    end

  end

end
