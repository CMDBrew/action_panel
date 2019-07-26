require 'rails_helper'

describe 'SwitchInput', type: :feature do
  context 'Form' do
    before do
      add_user_resource
    end

    it 'shows input' do
      visit new_admin_user_path
      expect(page).to have_css('.form-switch', count: 1)
      expect(page).to have_css('.form-switch-label', count: 1)
      expect(page).to have_css('.form-switch-input', count: 1)
    end
  end
end
