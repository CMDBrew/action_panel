# Global configurations
To configure ActiveAdmin create an initializer
```ruby
# config/initializers/activeadmin_bootstrap.rb
ActiveAdmin.setup do |config|
   config.layout_class = 'layout-1-column'
   config.component_class = {
     header: 'navbar-dark bg-dark navbar-expand-lg',
     title_bar: 'navbar-light bg-light',
     action_item: {
       group: 'btn-group',
       item: 'btn btn-secondary'
     },
     flash: {
       default: 'alert',
       alert: 'alert-warning',
       notice: 'alert-info'
     },
     blank_slate: 'alert alert-secondary text-center',
     tabs: 'nav-tabs',
     table_for: 'table',
     attributes_table: {
       wrapper: 'table-responsive',
       table: 'table text-break'
     },
     filters: {
       actions: {
         submit: 'btn btn-primary',
         cancel: 'btn btn-link'
       }
     },
     form: {
       has_many: {
         item: 'border mb-3',
         new: 'btn btn-sm btn-light',
         destroy: 'text-danger'
       },
       actions: {
         submit: 'btn btn-primary',
         cancel: 'btn btn-link'
       }
     },
     index_as_table: {
       wrapper: 'table-responsive',
       table: 'table table-sm',
       btn: {
         group: 'btn-group',
         item: 'btn btn-sm btn-light'
       }
     },
     table_tools: {
       btn: 'btn btn-sm btn-light',
       scopes: {
         tabs: 'nav-tabs',
         count: 'badge badge-primary'
       },
       indexes: {
         wrapper: 'btn-group',
         item: {
           inactive: 'btn btn-sm btn-light',
           active: 'btn btn-sm btn-primary'
         }
       }
     },
     panel: {
       wrapper: 'card',
       header: 'card-header',
       body: 'card-body'
     },
     active_admin_comments: {
       wrapper: 'card',
       header: 'card-header',
       body: 'card-body',
       submit: 'btn btn-primary'
     }
   }
   config.action_item_display = {
     new: :index, edit: :show, destroy: :show
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
     admin.layout_class = 'layout-1-column'
     admin.component_class = { header: 'navbar-dark bg-dark navbar-expand-lg' }
     admin.action_item_display = { destroy: :edit }
     admin.action_item_prefix = { new: '<i class="mdi mdi-plus"></i>' }
     admin.site_title_proc = proc { my_custom_site_title_method }
     admin.sidebar_position = 'right'
     admin.filter_position = 'sidebar'
     admin.active_admin_comment_input = 'string'
     admin.pagination_exclusion = []
   end
end
```

# Resource configurations
#### Layout Class
- Available `config.layout_class` options are: `layout-1-column`, `layout-2-column`.
- Default value is: `layout-1-column`
```ruby
ActiveAdmin.register AdminUser do
  config.layout_class = 'layout-2-column'
end
```

#### Component Class
- If the key is not specified it will fallback to default.
```ruby
ActiveAdmin.register AdminUser do
  config.component_class = { header: 'navbar-dark bg-dark navbar-expand-lg' }
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
- Available options are: `:index`, `:show`, `:edit`
- If the key is not specified it will fallback to default.
- You can also pass in an array (e.g. %i[edit show]).
```ruby
ActiveAdmin.register AdminUser do
  config.action_item_display = {
    new: :index, edit: :show, destroy: :show
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