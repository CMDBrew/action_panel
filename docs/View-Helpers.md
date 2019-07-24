## Add Icons
We recommend using svg for icons. To start using icons add your svgs to `app/images/activeadmin_bootstrap/icons` and add class `path` to `<path>`. Now you can use the helper method to insert icons inside your arb files.
```ruby
aa_icon('cat')
```

## Menu Label
Add `icon` and `count` (badge) to your menu
```ruby
ActiveAdmin.register_page 'Dashboard' do
  menu label: proc { menu_label('Dashboard', icon: aa_icon('dashboard'), count: 10) }
end
```