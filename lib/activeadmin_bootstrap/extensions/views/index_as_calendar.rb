module ActiveAdmin

  module Views

    # Overwrite IndexAsCalendar - https://github.com/bys-control/activeadmin-index_as_calendar/blob/master/config/initializers/active_admin_index_calendar.rb
    class IndexAsCalendar < ActiveAdmin::Component

      def build(page_presenter, collection)
        add_class 'calendar'
        context =
          { page_presenter: page_presenter, collection: collection, fullCalendarOptions: nil }
        events = instance_exec(context, &page_presenter.block) if page_presenter.block.present?

        # Render fullCalendar
        div class: 'mb-3' do
          render partial: 'activeadmin_bootstrap/calendar',
                 locals: { events: events, options: context[:fullCalendarOptions].to_json }
        end
      end

      def self.index_name
        'calendar'
      end

    end

  end

end
