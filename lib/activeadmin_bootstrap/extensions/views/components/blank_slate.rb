module ActiveAdmin

  module Views

    # Overwrite BlankSlate - lib/activeadmin_bootstrap/extensions/views/components/index_list.rb
    class BlankSlate < ActiveAdmin::Component

      include ActiveAdminBootstrap::ConfigsFinder

      def default_class_name
        "blank_slate_container #{component_class(:blank_slate)}"
      end

    end

  end

end
