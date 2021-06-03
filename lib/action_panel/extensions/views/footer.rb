module ActiveAdmin

  module Views

    # Overwrite Footer - lib/active_admin/views/footer.rb
    class Footer < Component

      private

      def powered_by_message
        I18n.t('action_panel.footer.powered_by',
               name:
                 link_to('ActionPanel', 'https://cmdbrew.com/action_panel',
                         target: '_blank', rel: 'noopener'),
               version: ActionPanel::VERSION).html_safe
      end

    end

  end

end
