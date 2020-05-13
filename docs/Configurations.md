# Global configurations
To configure ActiveAdmin create an initializer
```ruby
# config/initializers/activeadmin_bootstrap.rb
ActiveAdmin.setup do |config|
   config.header_class = 'navbar-dark bg-dark navbar-expand-lg'
   config.title_bar_class = 'navbar-light bg-light'
   config.action_item_class = 'btn btn-secondary'
   config.site_title_proc = proc { my_custom_site_title_method }
   config.sidebar_position = 'right'
   config.filter_position = 'sidebar'
   config.active_admin_comment_input = 'text'
   config.new_action_item_display = :index
   config.edit_action_item_display = :show
   config.destroy_action_item_display = :show
   config.pagination_exclusion = []
   config.action_item_new_label_prefix = ''
   config.action_item_edit_label_prefix = ''
   config.action_item_delete_label_prefix = ''
end
```

# Namespace configurations
```ruby
# config/initializers/activeadmin_bootstrap.rb
ActiveAdmin.setup do |config|
   config.namespace :admin do |admin|
     admin.header_class = 'navbar-dark bg-dark navbar-expand-lg'
     admin.title_bar_class = 'navbar-light bg-light'
     admin.action_item_class = 'btn btn-secondary'
     admin.site_title_proc = proc { my_custom_site_title_method }
     admin.sidebar_position = 'right'
     admin.filter_position = 'sidebar'
     config.active_admin_comment_input = 'string'
     admin.new_action_item_display = :index
     admin.edit_action_item_display = :show
     admin.destroy_action_item_display = :show
     config.pagination_exclusion = []
     config.action_item_new_label_prefix = ''
     config.action_item_edit_label_prefix = ''
     config.action_item_delete_label_prefix = ''
   end
end
```

# Resource configurations
#### Header
- Default value is: `navbar-dark bg-dark navbar-expand-lg`
```ruby
ActiveAdmin.register AdminUser do
  config.header_class = 'navbar-light bg-light navbar-expand-lg'
end
```

#### TitleBar
- `title_bar_class` default value is: `navbar-light bg-light`
- `action_item_class` default value is: `btn btn-secondary`
```ruby
ActiveAdmin.register AdminUser do
  config.title_bar_class = 'navbar-dark bg-dark'
  config.action_item_class = 'btn btn-primary'
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

#### ActionItem Label Prefixes
- You can also pass the option as per page basis. Please see below.
```ruby
ActiveAdmin.register AdminUser do
  config.action_item_new_label_prefix = "<i class='mdi mdi-plus'></i>"
  config.action_item_edit_label_prefix = "<i class='mdi mdi-square-edit-outline'></i>"
  config.action_item_delete_label_prefix = "<i class='mdi mdi-delete'></i>"
end
```

#### Filter Position
- Available `config.filter_position` options are: `sidebar`, `table_tools`, `slide_pane`
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

#### Pagination Exclusion
- Default value `[]`
Add additional pagination exclusions to hide pagination in the index view for custom IndexAs components.
```ruby
ActiveAdmin.setup do |config|
  config.pagination_exclusion = %i[index_as_custom]
end
```

# Theming
- See **[_bootstrap_vars.scss](../app/assets/stylesheets/activeadmin_bootstrap/meta/_bootstrap_vars.scss)** for available bootstrap configurations
- See **[_vars.scss](../app/assets/stylesheets/activeadmin_bootstrap/meta/_vars.scss)** for available activeadmin component configurations.