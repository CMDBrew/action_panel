module ActiveAdmin

  # Overwrite BaseController - lib/active_admin/base_controller.rb
  class BaseController < ::InheritedResources::Base

    before_action :reset_tab, if: :should_reset_resource_scope?

    def default_url_options
      super.merge(tab: params[:tab], resource_scope: controller_name, resource_action: action_name)
    end

    private

    def reset_tab
      params.delete(:tab)
    end

    def should_reset_resource_scope?
      (params[:resource_scope].present? && params[:resource_scope] != controller_name) ||
        (params[:resource_action].present? && !action_pairing)
    end

    def action_pairing
      case params[:resource_action]
      when 'edit', 'update' then %w[edit update].include? action_name
      else action_name == params[:resource_action]
      end
    end

  end

end
