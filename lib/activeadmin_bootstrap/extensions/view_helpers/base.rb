module ViewHelpers

  # ViewHelpers Base
  module Base

    def aa_icon(icon, prefix: 'aa-icon', path: 'activeadmin_bootstrap/icons')
      return if icon.blank?

      if block_given?
        yield
      else
        inline_svg "#{path}/#{icon}", class: prefix
      end
    end

    private

    def bs_class_for(type)
      {
        success: 'alert-success',
        error: 'alert-danger',
        alert: 'alert-warning',
        notice: 'alert-info'
      }[type.to_sym] || type.to_s
    end

  end

end
