require 'rails_helper'

RSpec.describe ActiveAdmin::Views::SiteTitle do
  let(:helpers) { mock_action_view }
  let(:settings) { ActiveAdmin::SettingsNode.build(ActiveAdmin::NamespaceSettings) }

  def build_title(namespace)
    render_arbre_component({ namespace: namespace }, helpers) do
      insert_tag ActiveAdmin::Views::SiteTitle, assigns[:namespace]
    end
  end

  def double(params)
    params.each { |key, value| settings.send "#{key}=", value }
    settings
  end

  describe 'html' do
    let(:namespace) do
      double site_title: 'Hello World',
             site_title_image: nil,
             site_title_link: nil
    end

    let(:site_title) { build_title(namespace) }

    it { expect(site_title.class_list).to include('navbar-brand') }
    it { expect(site_title.id).to include('site_title') }
  end
end
