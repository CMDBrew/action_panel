module ActiveAdmin

  module Views

    # Overwrite BlankSlate - lib/action_panel/extensions/views/components/index_list.rb
    class BlankSlate < ActiveAdmin::Component

      include ActionPanel::ConfigsFinder

      def default_class_name
        "blank_slate_container #{component_class(:blank_slate)}"
      end

    end

  end

end
