require 'rails_helper'

RSpec.describe ActiveAdmin::Views::DropdownMenu do
  describe 'dropdown_menu' do
    subject do
      render_arbre_component do
        dropdown_menu('test') do
          item 'link', '#'
        end
      end
    end

    let(:html) { Capybara.string(subject.to_s) }

    describe '#class_list' do
      subject { super().class_list }
      it { is_expected.to include('dropdown') }
    end

    describe '#content' do
      it { expect(html).to have_selector('.dropdown-toggle') }
      it { expect(html).to have_selector('.dropdown-menu') }
      it { expect(html).to have_selector('.dropdown-item') }
    end
  end
end
