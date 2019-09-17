require 'rails_helper'

describe 'Select2Input', type: :feature do
  context 'Form' do
    before do
      add_user_resource
    end

    it 'shows input' do
      visit new_admin_user_path
      expect(page).to have_css('.color_picker', count: 1)
    end
  end
end
