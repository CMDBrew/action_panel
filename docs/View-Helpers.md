## Add Icons
We recommend using svg for icons. To start using icons add your svgs to `app/images/wrap_activeadmin/icons` and add class `path` to `<path>`. Now you can use the helper method to insert icons inside your arb files.
```ruby
waa_icon('cat')
```

## Menu Label
Add `icon` and `count` (badge) to your menu 
```ruby
ActiveAdmin.register_page 'Dashboard' do
  menu label: proc { menu_label('Dashboard', icon: waa_icon('dashboard'), count: 10) }
end
```