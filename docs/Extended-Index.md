## Index As Calendar
Index calendar view
Extracted and extended from https://github.com/bys-control/activeadmin-index_as_calendar
## Usage

### Basic usage

To render default calendar for your AA resource do

```RUBY
ActiveAdmin.register Invoices do

  index_as_calendar

end
```

This will render a default calendar view with default event options:
```RUBY
events = collection.map do |item|
  {
    id: item.id,
    title: item.to_s,
    start: item.created_at.blank
  }
end
```

### Customization

```RUBY
ActiveAdmin.register Invoices do

  index_as_calendar(includes: %i[partner]) do |item|
    {
      id: item.id,
      title: item.partner.name,
      start: item.issue_date,
      url: "#{admin_invoice_path(item)}",
      tooltip: {
       title: "Due date #{item.due_date.to_s}",
       text: item.balance.blank? ? nil : item.balance.to_s
      },
      color: item.balance>0 ? (item.due_date.blank? ? 'green' : (item.due_date <= DateTime.now.beginning_of_day ? 'red' : 'olive' )) : 'green',
      textColor: 'white'
    }
  end
end
```

The helper function `index_as_calendar` receives a hash with configuration parameters and a code block that should return a hash with the mappings of model fields to event fields. Rendered events can be configured as specified in [fullCalendar documentation](http://fullcalendar.io/docs/event_data/Event_Object/).

Configuration parameters defaults to:

```RUBY
default_options = {
  :model => nil,   # Model to be used to fetch events. Defaults to ActiveAdmin resource model.
  :includes => [], # Eager loading of related models
  :start_date => :created_at, # Field to be used as start date for events
  :end_date => nil, # Field to be used as end date for events
  :block => block # Block with the model<->event field mappings
}
```