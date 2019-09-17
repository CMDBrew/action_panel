module ActiveAdminResourceSpecHelper

  # rubocop:disable all
  def add_user_resource(_options = {})
    ActiveAdmin.register User do
      config.filters = true

      filter :birthday, as: :date_time_range
      filter :created_at, as: :date_time_range

      form do |f|
        f.semantic_errors(*f.object.errors.keys)

        f.inputs 'General' do
          f.input :avatar, as: :file
          f.input :first_name
          f.input :last_name
          f.input :super_admin, as: :switch
          f.input :biography, as: :trix_editor
          f.input :color,
                  as: :color_picker,
                  input_html: {
                    data: { minicolors: { swatches: %w[fff eee fcfcfc 222] } }
                  }
          f.input :category,
                  as: :select2,
                  collection: [
                    ['label_1', 'id_1', { 'data-template': 'template_1' }],
                    ['label_2', 'id_2', { 'data-template': 'template_2' }]
                  ],
                  input_html: {
                    data: {
                      'select2-options': {}, # see select2 docs for options
                      'select2-search': true,
                      'select2-template': true,
                      'select2-selection-template': true,
                      'select2-other': true,
                      'select2-placeholder': 'Please select'
                    }
                  }

          f.input :birthday, as: :just_datetime_picker
        end

        f.actions
      end
    end
    Rails.application.reload_routes!
  end
  # rubocop:enable all

end
