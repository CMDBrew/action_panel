## Index As Calendar
Index calendar view
For more information please see https://github.com/bys-control/activeadmin-index_as_calendar
```ruby
index_as_calendar ajax: true do |item|
  {
    id: item.id,
    title: item.email,
    start: item.created_at,
    url: admin_admin_user_path(item).to_s,
    popover: {
      title: item.email,
      content: "Created at #{item.created_at}"
    },
    color: 'green',
    textColor: 'white'
  }
end
```