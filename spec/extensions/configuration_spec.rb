require 'rails_helper'

RSpec.describe ActiveAdmin::Views::Header do
  let(:application) { ActiveAdmin::Application.new }
  let(:defaults) { ActiveAdminBootstrap::ConfigsDefault }

  describe 'Default Config' do
    it { expect(application.component_class).to eq(defaults::COMPONENT_CLASS) }
    it { expect(application.sidebar_position).to eq(defaults::SIDEBAR_POSITION) }
    it { expect(application.filter_position).to eq(defaults::FILTER_POSITION) }

    it do
      expect(application.active_admin_comment_input).to eq(defaults::ACTIVE_ADMIN_COMMENT_INPUT)
    end

    it { expect(application.action_item_display).to eq(defaults::ACTION_ITEM_DISPLAY) }
    it { expect(application.action_item_prefix).to eq(defaults::ACTION_ITEM_PREFIX) }
    it { expect(application.pagination_exclusion).to eq(defaults::PAGINATION_EXCLUSION) }
  end

  describe 'Global Config' do
    before do
      application.component_class = { header: 'navbar-light bg-light' }
      application.sidebar_position = 'left'
      application.filter_position = 'main'
      application.active_admin_comment_input = 'string'
      application.action_item_display = { destroy: %i[show edit] }
      application.action_item_prefix = { new: 'fake_icon' }
      application.pagination_exclusion = %i[index_as_custom]
    end

    it { expect(application.component_class[:header]).to eq('navbar-light bg-light') }
    it { expect(application.component_class[:title_bar]).to eq('navbar-light bg-light') }
    it { expect(application.sidebar_position).to eq('left') }
    it { expect(application.filter_position).to eq('main') }
    it { expect(application.active_admin_comment_input).to eq('string') }
    it do
      expect(application.action_item_display).
        to eq(new: :index, edit: :show, destroy: %i[show edit])
    end
    it { expect(application.action_item_prefix).to eq(new: 'fake_icon', edit: nil, destroy: nil) }
    it { expect(application.pagination_exclusion).to eq(%i[index_as_custom]) }
  end

  describe 'Namespace Config' do
    let(:namespace) { ActiveAdmin::Namespace.new(application, :hosts) }

    before do
      namespace.component_class = { header: 'navbar-light bg-light' }
      namespace.sidebar_position = 'left'
      namespace.filter_position = 'main'
      namespace.active_admin_comment_input = 'string'
      namespace.action_item_display = { destroy: %i[show edit] }
      namespace.action_item_prefix = { new: 'fake_icon' }
      namespace.pagination_exclusion = %i[index_as_custom]
    end

    it { expect(namespace.component_class[:header]).to eq('navbar-light bg-light') }
    it { expect(namespace.component_class[:title_bar]).to eq('navbar-light bg-light') }
    it { expect(namespace.sidebar_position).to eq('left') }
    it { expect(namespace.filter_position).to eq('main') }
    it { expect(namespace.active_admin_comment_input).to eq('string') }
    it do
      expect(namespace.action_item_display).
        to eq(new: :index, edit: :show, destroy: %i[show edit])
    end
    it { expect(namespace.action_item_prefix).to eq(new: 'fake_icon', edit: nil, destroy: nil) }
    it { expect(namespace.pagination_exclusion).to eq(%i[index_as_custom]) }
  end

  describe 'Resource Config' do
    let(:application) { ActiveAdmin::Application.new }
    let(:namespace) { ActiveAdmin::Namespace.new(application, :admin) }
    let(:resource) do
      namespace.register(User) do
        config.component_class = { header: 'navbar-light bg-light' }
        config.sidebar_position = 'left'
        config.filter_position = 'main'
        config.action_item_display = { destroy: %i[show edit] }
        config.action_item_prefix = { new: 'fake_icon' }
      end
    end

    it { expect(resource.component_class[:header]).to eq('navbar-light bg-light') }
    it { expect(resource.component_class[:title_bar]).to eq('navbar-light bg-light') }
    it { expect(resource.sidebar_position).to eq('left') }
    it { expect(resource.filter_position).to eq('main') }
    it do
      expect(resource.action_item_display).
        to eq(new: :index, edit: :show, destroy: %i[show edit])
    end
    it { expect(resource.action_item_prefix).to eq(new: 'fake_icon', edit: nil, destroy: nil) }
  end
end
