module Formtastic

  # Overwriting FormBuilder - formtastic/lib/formtastic/form_builder.rb
  class FormBuilder < ActionView::Helpers::FormBuilder

    configure :default_inline_error_class, 'small text-danger'
    configure :default_error_list_class, 'errors'
    configure :default_hint_class, 'small text-secondary'

  end

end
