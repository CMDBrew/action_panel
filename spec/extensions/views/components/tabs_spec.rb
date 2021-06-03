require 'rails_helper'

RSpec.describe ActiveAdmin::Views::Tabs do
  describe 'tabs' do
    subject do
      render_arbre_component do
        tabs do
          tab 'tab-1'
          tab 'tab-2'
        end
      end
    end

    let(:html) { Capybara.string(subject.to_s) }

    describe '#class_list' do
      it { expect(html).to have_selector('.nav') }
      it { expect(html).to have_selector('.tab-ctrls') }
      it { expect(html).to have_selector('.tab-content') }
      it { expect(html).to have_selector('.nav-item') }
      it { expect(html).to have_selector('.nav-link') }
    end
  end
end
