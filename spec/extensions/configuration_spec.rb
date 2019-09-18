require 'rails_helper'

RSpec.describe ActiveAdmin::Views::Header do
  let(:application) { ActiveAdmin::Application.new }

  describe 'Default Config' do
    it { expect(application.navigation).to eq('top') }
    it { expect(application.sidebar_position).to eq('right') }
    it { expect(application.filter_position).to eq('sidebar') }
    it { expect(application.active_admin_comment_input).to eq('text') }
    it { expect(application.new_action_item_display).to eq(:index) }
    it { expect(application.edit_action_item_display).to eq(:show) }
    it { expect(application.destroy_action_item_display).to eq(:show) }
    it { expect(application.pagination_exclusion).to eq(%i[]) }
  end

  describe 'Global Config' do
    before do
      application.navigation = 'fixed_top'
      application.sidebar_position = 'left'
      application.filter_position = 'table_tools'
      application.active_admin_comment_input = 'string'
      application.new_action_item_display = :show
      application.edit_action_item_display = :show
      application.destroy_action_item_display = :edit
      application.pagination_exclusion = %i[index_as_custom]
    end

    it { expect(application.navigation).to eq('fixed_top') }
    it { expect(application.sidebar_position).to eq('left') }
    it { expect(application.filter_position).to eq('table_tools') }
    it { expect(application.active_admin_comment_input).to eq('string') }
    it { expect(application.new_action_item_display).to eq(:show) }
    it { expect(application.edit_action_item_display).to eq(:show) }
    it { expect(application.destroy_action_item_display).to eq(:edit) }
    it { expect(application.pagination_exclusion).to eq(%i[index_as_custom]) }
  end

  describe 'Namespace Config' do
    let(:namespace) { ActiveAdmin::Namespace.new(application, :hosts) }

    before do
      namespace.navigation = 'fixed_top'
      namespace.sidebar_position = 'left'
      namespace.filter_position = 'table_tools'
      namespace.active_admin_comment_input = 'string'
      namespace.new_action_item_display = :show
      namespace.edit_action_item_display = :show
      namespace.destroy_action_item_display = :edit
      namespace.pagination_exclusion = %i[index_as_custom]
    end

    it { expect(namespace.navigation).to eq('fixed_top') }
    it { expect(namespace.sidebar_position).to eq('left') }
    it { expect(namespace.filter_position).to eq('table_tools') }
    it { expect(namespace.active_admin_comment_input).to eq('string') }
    it { expect(namespace.new_action_item_display).to eq(:show) }
    it { expect(namespace.edit_action_item_display).to eq(:show) }
    it { expect(namespace.destroy_action_item_display).to eq(:edit) }
    it { expect(namespace.pagination_exclusion).to eq(%i[index_as_custom]) }
  end

  describe 'Resource Config' do
    let(:application) { ActiveAdmin::Application.new }
    let(:namespace) { ActiveAdmin::Namespace.new(application, :admin) }
    let(:resource) do
      namespace.register(User) do
        config.navigation = 'fixed_top'
        config.sidebar_position = 'left'
        config.filter_position = 'table_tools'
        config.new_action_item_display = :show
        config.edit_action_item_display = :show
        config.destroy_action_item_display = :edit
      end
    end

    it { expect(resource.navigation).to eq('fixed_top') }
    it { expect(resource.sidebar_position).to eq('left') }
    it { expect(resource.filter_position).to eq('table_tools') }
    it { expect(resource.new_action_item_display).to eq(:show) }
    it { expect(resource.edit_action_item_display).to eq(:show) }
    it { expect(resource.destroy_action_item_display).to eq(:edit) }
  end
end
