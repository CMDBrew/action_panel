# @TODO - This is fixed in latest version. See https://github.com/activeadmin/activeadmin/pull/5870
module ActiveAdmin

  class ResourceController < BaseController

    # Overwrite PolymorphicRoutes - lib/active_admin/resource_controller/polymorphic_routes.rb
    module PolymorphicRoutes

      private

      def to_named_resource(record)
        return ActiveAdmin::Model.new(active_admin_config, record) if record.is_a?(resource_class)

        belongs_to_resource = active_admin_config.belongs_to_config.try(:resource)
        if belongs_to_resource && record.is_a?(belongs_to_resource.resource_class)
          return ActiveAdmin::Model.new(belongs_to_resource, record)
        end

        record
      end

    end

  end

end
