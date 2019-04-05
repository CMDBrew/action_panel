require 'rails_helper'

RSpec.describe ActiveAdmin::Views::IndexList do
  describe 'index_list' do
    subject do
      render_arbre_component do
        index_list_renderer []
      end
    end

    let(:html) { Capybara.string(subject.to_s) }

    describe '#class_list' do
      subject { super().class_list }
      it      { is_expected.to include('indexes', 'table_tools_segmented_control', 'btn-group') }
    end
  end
end
