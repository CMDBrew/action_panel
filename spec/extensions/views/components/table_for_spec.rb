require 'rails_helper'

RSpec.describe ActiveAdmin::Views::TableFor do
  describe 'table_for' do
    subject do
      render_arbre_component do
        table_for(Class.new)
      end
    end

    let(:html) { Capybara.string(subject.to_s) }

    describe '#class_list' do
      subject { super().class_list }
      it      { is_expected.to include('table_for') }
    end
  end
end
