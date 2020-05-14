# Global configurations
To configure ActiveAdmin create an initializer
```ruby
# config/initializers/activeadmin_bootstrap.rb
ActiveAdmin.setup do |config|
   config.component_class = {
     header: 'navbar-dark bg-dark navbar-expand-lg',
     title_bar: 'navbar-light bg-light',
     action_item: 'btn btn-secondary',
     panel: {
       wrapper: 'card',
       header: 'card-header',
       body: 'card-body'
     }
   }
   config.action_item_display = {
     new: 'index', edit: 'show', destroy: 'show'
   }
   config.action_item_prefix = {
     new: nil, edit: nil, destroy: nil
   }
   config.site_title_proc = proc { my_custom_site_title_method }
   config.sidebar_position = 'right'
   config.filter_position = 'sidebar'
   config.active_admin_comment_input = 'text'
   config.pagination_exclusion = []
end
```

# Namespace configurations
```ruby
# config/initializers/activeadmin_bootstrap.rb
ActiveAdmin.setup do |config|
   config.namespace :admin do |admin|
     admin.component_class = {
       header: 'navbar-dark bg-dark navbar-expand-lg',
       title_bar: 'navbar-light bg-light',
       action_item: 'btn btn-secondary',
       panel: {
         wrapper: 'card',
         header: 'card-header',
         body: 'card-body'
       }
     }
     admin.action_item_display = {
       new: 'index', edit: 'show', destroy: 'show'
     }
     admin.action_item_prefix = {
       new: nil, edit: nil, destroy: nil
     }
     admin.site_title_proc = proc { my_custom_site_title_method }
     admin.sidebar_position = 'right'
     admin.filter_position = 'sidebar'
     config.active_admin_comment_input = 'string'
     config.pagination_exclusion = []
   end
end
```

# Resource configurations
#### Component Class
- If the key is not specified it will fallback to default.
```ruby
ActiveAdmin.register AdminUser do
  config.component_class = {
    header: 'navbar-dark bg-dark navbar-expand-lg',
    title_bar: 'navbar-light bg-light',
    action_item: 'btn btn-secondary',
    panel: {
      wrapper: 'card',
      header: 'card-header',
      body: 'card-body'
    }
  }
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
- Available `config.filter_position` options are: `sidebar`, `main`
- Default value is: `sidebar`
```ruby
ActiveAdmin.register AdminUser do
  config.filter_position = 'main'
end
```

#### Action Items Display Actions
- Available options are: `index`, `show`, `edit`
- If the key is not specified it will fallback to default.
```ruby
ActiveAdmin.register AdminUser do
  config.action_item_display = {
    new: 'index', edit: 'show', destroy: 'show'
  }
end
```

#### ActionItem Prefixes
- Available options are: `index`, `show`, `edit`
- If the key is not specified it will fallback to default.
```ruby
ActiveAdmin.register AdminUser do
  config.action_item_prefix = {
    new: "<i class='mdi mdi-plus'></i>",
    edit: "<i class='mdi mdi-square-edit-outline'></i>",
    destroy: "<i class='mdi mdi-delete'></i>"
  }
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