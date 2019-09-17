require 'rails_helper'

describe 'FileInput', type: :feature do
  context 'Form' do
    before do
      add_user_resource
    end

    it 'shows input' do
      visit new_admin_user_path
      expect(page).to have_css('.custom-file-input-group', count: 1)
      expect(page).to have_css('.custom-file-input', count: 1)
      expect(page).to have_css('.custom-file-preview', count: 1)
    end
  end
end
