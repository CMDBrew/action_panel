module ViewHelpers

  # ViewHelpers For Menu
  module Menu

    def menu_label(label, *args)
      options = args.extract_options!
      icon    = options.delete(:icon) { nil }
      count   = options.delete(:count) { 0 }
      safe_join [
        waa_icon(icon, options), menu_title(label),
        menu_badge(count)
      ]
    end

    private

    def menu_title(label)
      label.is_a?(Class) ? label.model_name.human(count: 2) : label
    end

    def menu_badge(count)
      return unless count.is_a?(Integer) && count.positive?

      count = '99+' if count > 99
      content_tag(:span, count, class: WrapActiveAdmin::MENU_BADGE_CLASS)
    end

  end

end
