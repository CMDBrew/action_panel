require 'rails_helper'

describe 'TrixEditorInput', type: :feature do
  context 'Form' do
    before do
      add_user_resource
    end

    it 'shows input' do
      visit new_admin_user_path
      expect(page).to have_css('.trix-editor-wrapper', count: 1)
    end
  end
end
