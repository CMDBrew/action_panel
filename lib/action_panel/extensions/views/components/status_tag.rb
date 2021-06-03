module ActiveAdmin

  module Views

    # Overwrite StatusTag - lib/active_admin/views/components/status_tag.rb
    class StatusTag < ActiveAdmin::Component

      def default_class_name
        'status_tag badge'
      end

      protected

      def status_to_class(status)
        case status
        when 'Unset', nil then 'unset no'
        when 'Yes' then 'badge-success'
        when 'No' then 'badge-danger'
        else status.to_s.titleize.gsub(/\s/, '').underscore
        end
      end

    end

  end

end
