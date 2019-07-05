require 'rails_helper'

RSpec.describe ActiveAdmin::Views::Header do
  let(:helpers)     { mock_action_view }
  let(:application) { ActiveAdmin::Application.new }
  let(:namespace)   { ActiveAdmin::Namespace.new(application, :admin) }
  let(:menu)        { ActiveAdmin::Menu.new }

  def build_header(namespace, menu)
    render_arbre_component({ namespace: namespace }, helpers) do
      insert_tag ActiveAdmin::Views::Header, assigns[:namespace], menu
    end
  end

  describe 'default' do
    let(:header) { build_header(namespace, menu) }
    it { expect(header.id).to include('header') }
  end

  describe 'customize header position as top' do
    before do
      ActiveAdmin.setup do |config|
        config.navigation = 'top'
      end
    end

    let(:header) { build_header(namespace, menu) }

    it { expect(header.find_by_class('navbar-toggler').present?).to eq(true) }
    it { expect(header.class_list).to include('navbar', 'top') }
  end

  describe 'customize header position as fixed_top' do
    before do
      ActiveAdmin.setup do |config|
        config.navigation = 'fixed_top'
      end
    end

    let(:header) { build_header(namespace, menu) }

    it { expect(header.find_by_class('navbar-toggler').present?).to eq(true) }
    it { expect(header.class_list).to include('navbar', 'fixed_top') }
  end

  describe 'customize header position as sidebar' do
    before do
      ActiveAdmin.setup do |config|
        config.navigation = 'sidebar'
      end
    end

    let(:header) { build_header(namespace, menu) }

    it { expect(header.find_by_class('navbar-toggler').present?).to eq(false) }
    it { expect(header.class_list).to include('navbar', 'sidebar') }
  end
end
