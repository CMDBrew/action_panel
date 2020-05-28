module Formtastic

  module Inputs

    # Overwrite PasswordInput - formtastic/lib/formtastic/inputs/password_input.rb
    class PasswordInput

      include ActiveAdminBootstrap::MdiIcon

      def to_html
        input_wrapping do
          label_html << input_html
        end
      end

      private

      def input_html
        template.content_tag :div, class: 'input-group custom-password-input-group' do
          builder.password_field(method, input_html_options) + mode_toggler
        end
      end

      def mode_toggler
        template.content_tag :div, class: 'password-toggler' do
          show_toggler + hide_toggler
        end
      end

      def show_toggler
        template.content_tag(
          :span, mdi_icon('eye'),
          class: 'icon-show',
          title: ::I18n.t(:show, scope: 'activeadmin_bootstrap.formtastic.custom_password'),
          data: { toggle: 'tooltip', placement: 'bottom' }
        )
      end

      def hide_toggler
        template.content_tag(
          :span, mdi_icon('eye-off'),
          class: 'icon-hide',
          title: ::I18n.t(:hide, scope: 'activeadmin_bootstrap.formtastic.custom_password'),
          data: { toggle: 'tooltip', placement: 'bottom' }
        )
      end

    end

  end

end
