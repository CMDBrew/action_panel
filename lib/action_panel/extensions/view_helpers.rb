# Extend ActiveAdmin ViewHelpers
module ActiveAdmin::ViewHelpers

  include ViewHelpers::Base
  include ViewHelpers::Components
  include ViewHelpers::Notice
  include ActionPanel::ConfigsFinder
  include ActionPanel::MdiIcon

  alias batch_form active_admin_form_for

end
