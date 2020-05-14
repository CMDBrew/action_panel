# Extend ActiveAdmin ViewHelpers
module ActiveAdmin::ViewHelpers

  include ViewHelpers::Base
  include ViewHelpers::Notice
  include ActiveAdminBootstrap::ConfigsFinder

  alias batch_form active_admin_form_for

end
