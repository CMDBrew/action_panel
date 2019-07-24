require 'rails_helper'

RSpec.describe ActiveAdmin::Views::Columns do
  describe 'columns' do
    subject do
      render_arbre_component do
        columns do
          column span: 4
          column span: 8
        end
      end
    end

    let(:html) { Capybara.string(subject.to_s) }

    describe '#class_list' do
      it { expect(html).to have_selector('.row') }
      it { expect(html).to have_selector(".col-#{ActiveAdminBootstrap::COLUMN_BREAKPOINT}-4") }
      it { expect(html).to have_selector(".col-#{ActiveAdminBootstrap::COLUMN_BREAKPOINT}-8") }
    end
  end
end
