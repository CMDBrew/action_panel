# Switch Inputs
```ruby
f.input :super_admin, as: :switch
```

# File Inputs
The preview options needs to be an image path or nil
```ruby
f.input :avatar, as: :file, preview: :avatar
```

# ActionText Input
For more information please see https://edgeguides.rubyonrails.org/action_text_overview.html#examples
```ruby
f.input :body, as: :rich_text_area
```

# ColorPicker Input
For more information please see https://github.com/kostia/jquery-minicolors-rails
```ruby
f.input :color,
        as: :color_picker,
        input_html: {
          data: { minicolors: { swatches: %w[fff eee fcfcfc 222] } }
        }
```

# Select2 Input
For more information please see https://select2.org/
```ruby
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
```

# JustDateTimePicker Input
For more information please see https://github.com/mspanc/just-datetime-picker
```ruby
# In your ActiveAdmin form
f.input :joined_at, as: :just_datetime_picker
```

```ruby
# In your model add
class User < ActiveRecord::Base
  just_define_datetime_picker :joined_at, add_to_attr_accessor: true
end
```

# Columns inside HasMany
Arbre has issues rendering inside Formtastic has_many see [Official Issue](https://github.com/activeadmin/activeadmin/issues/4043) so you can do the followings instead.
```ruby
f.has_many :links, allow_destroy: true do |k|
  k.inputs class: 'columns' do
    k.input :name, wrapper_html: { class: 'col-lg-6' }
    k.input :url,  wrapper_html: { class: 'col-lg-6' }
  end
end
```