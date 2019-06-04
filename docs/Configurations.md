## Initializers
To configure ActiveAdmin create an initializer
```ruby
# config/initializers/wrap_activeadmin.rb
ActiveAdmin.setup do |config|
   config.navigation = 'top'
   config.sidebar_position = 'right'
   config.filter_position = 'sidebar'
   config.new_action_item_display = :index
   config.edit_action_item_display = :show
   config.destroy_action_item_display = :show

   config.namespace :admin do |admin|
     admin.navigation = 'fixed_top'
     admin.sidebar_position = 'right'
     admin.filter_position = 'sidebar'
     admin.new_action_item_display = :index
     admin.edit_action_item_display = :show
     admin.destroy_action_item_display = :show
   end
end
```

#### Navigation
- Available `config.navigation` options are: `top`, `fixed_top`, `sidebar`
- Default value is: `top`
```ruby
ActiveAdmin.register AdminUser do
  config.navigation = 'sidebar'
end
```

#### Sidebar Position
- Available `config.sidebar_position` options are: `left`, `right`
- Default value is: `right`
- You can also pass the option as per page basis. Please see below.
```ruby
ActiveAdmin.register AdminUser do
  config.sidebar_position = 'left'
end
```

#### Filter Position
- Available `config.filter_position` options are: `sidebar`, `table_tools`
- Default value is: `sidebar`
```ruby
ActiveAdmin.register AdminUser do
  config.filter_position = 'table_tools'
end
```


#### Action Items Display Actions
- Available options are: `index`, `show`, `edit`
- Default value for `new_action_item_display` is: `index`
- Default value for `edit_action_item_display` is: `show`
- Default value for `destroy_action_item_display` is: `show`
```ruby
ActiveAdmin.register AdminUser do
  config.new_action_item_display = :index
  config.edit_action_item_display = :show
  config.destroy_action_item_display = :show
end
```


## Theming
- See **[_bootstrap_vars.scss](../app/assets/stylesheets/wrap_activeadmin/meta/_bootstrap_vars.scss)** for available bootstrap configurations
- See **[_vars.scss](../app/assets/stylesheets/wrap_activeadmin/meta/_vars.scss)** for available activeadmin component configurations.