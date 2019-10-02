## Form
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

## Panel
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

## Columns
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

## Tabs
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

## Dropdown Menu
Added new options for dropdown item
#### `item_divider` to create a divider
```ruby
dropdown_menu 'my dropdown' do
  item_divider
end
```

#### `raw_item` to render raw html content
```ruby
dropdown_menu 'my dropdown' do
  raw_item(div('my html content'))
end
```

## ActionItems
Added new options group for btn-groups
```ruby
action_item :view, only: :index, priority: 1, group: 10 do
  link_to 'my awesome link', "#"
end
```

