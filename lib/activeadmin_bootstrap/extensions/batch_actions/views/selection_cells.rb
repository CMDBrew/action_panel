module ActiveAdmin

  module BatchActions

    # Creates the toggle checkbox used to toggle the collection selection on/off
    class ResourceSelectionToggleCell < ActiveAdmin::Component

      def build(label_text = '')
        label do
          input type: 'checkbox', id: 'collection_selection_toggle_all',
                name: 'collection_selection_toggle_all', class: 'toggle_all'
          i '', class: 'checkbox-icon'
          text_node label_text if label_text.present?
        end
      end

    end

    # Creates the checkbox used to select a resource in the collection selection
    class ResourceSelectionCell < ActiveAdmin::Component

      def build(resource)
        label do
          input type: 'checkbox', id: "batch_action_item_#{resource.id}", value: resource.id,
                class: 'collection_selection', name: 'collection_selection[]'
          i '', class: 'checkbox-icon'
        end
      end

    end

  end

end
