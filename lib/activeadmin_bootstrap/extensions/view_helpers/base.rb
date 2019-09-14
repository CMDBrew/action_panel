module ViewHelpers

  # ViewHelpers Base
  module Base

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
