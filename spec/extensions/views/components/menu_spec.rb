require 'rails_helper'

RSpec.describe ActiveAdmin::Views::Menu do
  let(:menu)    { ActiveAdmin::Menu.new }
  let(:assigns) { { active_admin_menu: menu } }
  let(:helpers) { mock_action_view }

  let(:menu_component) do
    arbre(assigns, helpers) do
      insert_tag(ActiveAdmin::Views::Menu, active_admin_menu)
    end.children.first
  end

  describe 'does not have dropdown classes if not nested' do
    before do
      menu.add label: 'Reports', url: '/admin/reports'
    end

    let(:html) { Capybara.string(menu_component.to_s) }

    it { expect(html).to_not have_selector('ul.dropdown-menu') }
    it { expect(html).to_not have_selector('ul > li.dropdown-item') }
  end

  describe 'has dropdown classes if nested' do
    before do
      menu.add label: 'Reports', url: '/admin/reports' do |reports|
        reports.add label: 'A Sub Reports', url: '/admin/a-sub-reports'
        reports.add label: 'B Sub Reports', url: '/admin/b-sub-reports'
      end
    end

    let(:html) { Capybara.string(menu_component.to_s) }

    it { expect(html).to have_selector('ul.dropdown-menu') }
    it { expect(html).to have_selector('ul > li.dropdown-item') }
  end
end
