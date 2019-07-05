## Switch Inputs
```ruby
f.input :super_admin, as: :switch
```

## File Inputs
```ruby
f.input :avatar, as: :file, preview: :avatar
```

## Columns inside HasMany
Arbre has issues rendering inside Formtastic has_many see [Official Issue](https://github.com/activeadmin/activeadmin/issues/4043) so you can do the followings instead.
```ruby
f.has_many :links, allow_destroy: true do |k|
  k.inputs class: 'columns' do
    k.input :name, wrapper_html: { class: 'col-lg-6' }
    k.input :url,  wrapper_html: { class: 'col-lg-6' }
  end
end
```