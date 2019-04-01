module ViewHelpers

  # ViewHelpers Base
  module Base

    def waa_icon(icon, prefix: 'waa-icon', path: 'wrap_activeadmin/icons')
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
