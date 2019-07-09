module ActiveAdmin

  module IndexAsCalendar

    # Based on https://github.com/bys-control/activeadmin-index_as_calendar/blob/master/lib/index_as_calendar/dsl.rb
    module DSL

      #
      # Initializes activeadmin index as calendar
      #
      # rubocop:disable all
      def index_as_calendar(options = {}, &block)
        default_options = {
          ajax: true,   # Use AJAX to fetch events. Set to false to send data during render.
          model: nil,   # Model to be used to fetch events. Defaults to ActiveAdmin resource model.
          includes: [], # Eager loading of related models
          start_date: :created_at, # Field to be used as start date for events
          end_date: nil, # Field to be used as end date for events
          block: block, # Block with the model<->event field mappings
          fullCalendarOptions: nil, # fullCalendar options to be sent upon initialization
          default: false # Set this index view as default
        }
        options = default_options.deep_merge(options)

        # Defines controller for event_mapping model items to events
        controller do
          # rubocop:disable all
          def event_mapping(items, options)
            items.map do |item|
              if options[:block].present?
                instance_exec(item, &options[:block])
              else
                {
                  id: item.id,
                  title: item.to_s,
                  start: options[:start_date].blank? || item.send(options[:start_date]).blank? ? Date.today.to_s : item.send(options[:start_date]),
                  end: options[:end_date].blank? || item.send(options[:end_date]).blank? ? nil : item.send(options[:end_date])
                }
              end
            end
          end
          # rubocop:enable all
        end

        # Setup AJAX
        if options[:ajax]
          # Setup fullCalendar to use AJAX calls to retrieve event data
          index as: :calendar, default: options[:default] do |context|
            context[:fullCalendarOptions] = options[:fullCalendarOptions]
            {
              url: "#{collection_path}/index_as_events.json",
              type: 'GET',
              data: params
            }
          end

          # Defines collection_action to get events data
          collection_action :index_as_events, method: :get do
            items = options[:model] || end_of_association_chain
            items = instance_exec(items, &current_scope.scope_block) if params[:scope].present?
            items = items.includes(options[:includes]) if options[:includes].present?
            items =
              items.where(options[:start_date] => params[:start].to_date...params[:end].to_date).
              ransack(params[:q]).result

            events = event_mapping(items, options)

            respond_to do |format|
              format.json { render json: events }
            end
          end

        # Return events to be used during partial render
        else
          index as: :calendar, default: options[:default] do |context|
            context[:fullCalendarOptions] = options[:fullCalendarOptions]
            controller.event_mapping(context[:collection], options)
          end
        end
      end

    end

  end

end
