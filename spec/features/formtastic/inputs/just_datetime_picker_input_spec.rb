require 'rails_helper'

describe 'JustDatetimePickerInput', type: :feature do
  context 'Form' do
    before do
      add_user_resource
    end

    it 'shows input' do
      visit new_admin_user_path
      expect(page).to have_css('.just_datetime_picker', count: 1)
    end
  end
end
