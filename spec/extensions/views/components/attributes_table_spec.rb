require 'rails_helper'

RSpec.describe ActiveAdmin::Views::AttributesTable do
  describe 'attributes_table' do
    subject do
      render_arbre_component do
        attributes_table_for(Class.new)
      end
    end

    describe '#class_list' do
      subject { super().class_list }
      it      { is_expected.to include('table-responsive') }
    end

    describe '#content' do
      subject { super().children.first.class_list }
      it      { is_expected.to include('table', 'text-break') }
    end
  end
end
