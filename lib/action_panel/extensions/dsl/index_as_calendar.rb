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

        # Setup fullCalendar to use AJAX calls to retrieve event data
        index as: :calendar, default: options[:default] do |context|
          context[:fullCalendarOptions] = options[:fullCalendarOptions]
          {
            url: url_for(controller: controller_path, action: 'index_as_events', format: 'json'),
            type: 'GET',
            data: params
          }
        end

        # Defines collection_action to get events data
        collection_action :index_as_events, method: :get do
          items = options[:model] || end_of_association_chain
          items = instance_exec(items, &current_scope.scope_block) if params[:scope].present?
          items = items.includes(options[:includes]) if options[:includes].present?
          records =
            items.where("#{options[:start_date]} BETWEEN ? AND ?",
                        params[:start].to_date,
                        params[:end].to_date)
          if options[:end_date].present?
            records =
              items.or(items.where("#{options[:end_date]} BETWEEN ? AND ?",
                                   params[:start].to_date,
                                   params[:end].to_date)).
              or(items.where("#{options[:start_date]} <= ? AND #{options[:end_date]} >= ?",
                             params[:start].to_date, params[:end].to_date))
          end

          records = records.ransack(params[:q]).result
          events = event_mapping(records, options)

          respond_to do |format|
            format.json { render json: events }
          end
        end
      end

    end

  end

end
