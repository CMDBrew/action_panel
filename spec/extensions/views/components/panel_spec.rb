require 'rails_helper'

RSpec.describe ActiveAdmin::Views::Panel do
  describe 'panel' do
    subject do
      render_arbre_component do
        panel('test')
      end
    end

    let(:html) { Capybara.string(subject.to_s) }

    describe '#class_list' do
      subject { super().class_list }
      it      { is_expected.to include('panel') }
    end

    describe '#content' do
      it { expect(html).to have_selector('.panel-header') }
      it { expect(html).to have_selector('.title') }
      it { expect(html).to have_selector('.panel-body') }
    end
  end
end
