require 'rails_helper'

RSpec.describe ActiveAdmin::Views::ActionItems do
  let(:helpers)     { mock_action_view }
  let(:application) { ActiveAdmin::Application.new }
  let(:namespace)   { ActiveAdmin::Namespace.new(application, :admin) }
  let(:action_items) do
    [].push(
      ActiveAdmin::ActionItem.new('test') do
        link_to '123', '#'
      end
    )
  end

  def build_action_items(namespace, action_items)
    render_arbre_component({ namespace: namespace }, helpers) do
      insert_tag ActiveAdmin::Views::ActionItems, action_items
    end
  end

  describe 'html' do
    let(:action_items_html) { build_action_items(namespace, action_items) }
    it { expect(action_items_html.class_list).to include('action_items') }
  end
end
