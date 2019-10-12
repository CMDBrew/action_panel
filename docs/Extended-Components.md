# Form
Allowing multiple forms inside the form page without using partial
```ruby
form multiple: true do
  panel do
    form_section [:admin, resource] do |f|
      f.inputs do
        f.input :email
        f.input :super_admin, as: :switch
      end
      hr
      f.actions
    end
  end

  panel do
    form_section [:admin, resource] do |f|
      f.inputs do
        f.input :password
        f.input :password_confirmation
      end
      hr
      f.actions
    end
  end
end
```

# Panel
Title is not required for panel
```ruby
panel do
end
```

Header actions can now render block
```ruby
panel 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod' do
  header_action do
    div class: 'btn-group' do
      link_to('My Link', 'https://www.github.com/activeadmin/activeadmin',
              class: 'btn btn-sm btn-light') +
        link_to('My Link', 'https://www.github.com/activeadmin/activeadmin',
                class: 'btn btn-sm btn-light')
    end
  end
end
```

# Columns
Columns now use bootstrap grid
```ruby
columns do
  column(span: 8) {}
  column(span: 4) {}
end
```
becomes
```html
<div class="row">
  <div class="col-lg-8"></div>
  <div class="col-lg-4"></div>
</div>
```

You can pass in an extra `size` argument to change the breakpoint
```ruby
columns do
  column(span: 8, size: 'md') {}
  column(span: 4, size: 'md') {}
end
```
becomes
```html
<div class="row">
  <div class="col-md-8"></div>
  <div class="col-md-4"></div>
</div>
```

# Tabs
Allow none jquery tabs. Simply pass in option `http: true` and now it becomes a http tab with `params[:tab]` in the URL.
```ruby
tabs(http: true) do
  tab :tab_1 do
    ...
  end

  tab :tab_2 do
    ...
  end
end
```

# Dropdown Menu
Added new options for dropdown item
#### `item_divider` to create a divider
```ruby
dropdown_menu 'my dropdown' do
  item_divider
end
```

#### `item_html` to render raw html content
```ruby
dropdown_menu 'my dropdown' do
  item_html(div('my html content'))
end
```

# ActionItems
Added new options group for btn-groups. Default priority and group are both 99
```ruby
action_item :view, only: :index, priority: 1, group: 10 do
  link_to 'my awesome link', "#"
end
```

# Extra HTML
htmls allow you to put whatever content you want on the page.

```ruby
html :help do
  "Need help? Email us at help@example.com"
end
```
This will generate a html on every page for that resource. The first argument is used as the title, and can be a symbol, string, or lambda.

You can also use Arbre to define HTML content.
```ruby
html :help do
  ul do
    li "Second List First Item"
    li "Second List Second Item"
  end
end
```

HTMLs can be rendered on a specific action by passing :only or :except.
```ruby
html :help, only: :index do
  "Need help? Email us at help@example.com"
end
```

If you want to conditionally display a html content, use the :if option and pass it a proc which will be rendered within the view context.
```ruby
html :help, if: proc{ current_admin_user.super_admin? } do
  "Only for super admins!"
end
```

You can access your model as resource in the html too:
```ruby
html :custom, only: :show do
  resource.a_method
end
```

You can also render a partial:
```ruby
html :help                    # app/views/admin/posts/_help_html.html.erb
html :help, partial: 'custom' # app/views/admin/posts/_custom.html.erb
```

It’s possible to add custom class name to the html parent element by passing class option:
```ruby
html :help, class: 'custom_class'
```

By default htmls are positioned in the same order as they defined, but it’s also possible to specify their position manually:
```ruby
# will push Help section to the top (above default Filters section)
html :help, priority: 0
```
Default html priority is 10.


