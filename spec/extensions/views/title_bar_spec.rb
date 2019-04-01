require 'rails_helper'

RSpec.describe ActiveAdmin::Views::TitleBar do
  let(:helpers)      { mock_action_view }
  let(:application)  { ActiveAdmin::Application.new }
  let(:namespace)    { ActiveAdmin::Namespace.new(application, :admin) }
  let(:action_items) { [] }

  def build_title_bar(namespace, action_items)
    render_arbre_component({ namespace: namespace }, helpers) do
      insert_tag ActiveAdmin::Views::TitleBar, assigns[:namespace], action_items
    end
  end

  before do
    allow_any_instance_of(ActiveAdmin::Views::TitleBar).
      to receive(:links).and_return(nil)
    allow_any_instance_of(ActiveAdmin::Views::TitleBar).
      to receive(:build_action_items).and_return(nil)
  end

  describe 'html' do
    let(:title_bar) { build_title_bar(namespace, action_items) }
    it { expect(title_bar.id).to include('title_bar') }
    it { expect(title_bar.class_list).to include('navbar') }
    it { expect(title_bar.find_by_class('breadcrumb').present?).to eq(true) }
    it { expect(title_bar.find_by_class('breadcrumb-item').present?).to eq(true) }
  end
end
