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

  describe 'customize theme' do
    before { WrapActiveAdmin.header_class = 'navbar-light bg-red' }
    let(:header) { build_header(namespace, menu) }

    it { expect(header.class_list).to include('navbar-light', 'bg-red') }
  end

  describe 'customize header position as top' do
    before { WrapActiveAdmin.navigation = 'top' }
    let(:header) { build_header(namespace, menu) }

    it { expect(header.find_by_class('navbar-toggler').present?).to eq(true) }
    it { expect(header.find_by_class('collapse').present?).to eq(true) }
    it { expect(header.class_list).to include('navbar', 'navbar-expand-lg', 'top') }
  end

  describe 'customize header position as fixed_top' do
    before { WrapActiveAdmin.navigation = 'fixed_top' }
    let(:header) { build_header(namespace, menu) }

    it { expect(header.find_by_class('navbar-toggler').present?).to eq(true) }
    it { expect(header.find_by_class('collapse').present?).to eq(true) }
    it { expect(header.class_list).to include('navbar', 'navbar-expand-lg', 'fixed_top') }
  end

  describe 'customize header position as sidebar' do
    before { WrapActiveAdmin.navigation = 'sidebar' }
    let(:header) { build_header(namespace, menu) }

    it { expect(header.find_by_class('navbar-toggler').present?).to eq(false) }
    it { expect(header.find_by_class('collapse').present?).to eq(false) }
    it { expect(header.class_list).to include('navbar', 'navbar-expand', 'sidebar') }
  end
end
