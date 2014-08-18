require 'spec_helper'

describe Traducto::Helpers do
  describe "#t" do
    let(:action_view) { ActionView::Base.new }

    context "with the key welcome" do
      before { I18n.stub('translate').with('welcome', anything()).and_return('Hello!') }

      subject { action_view.t('welcome', format: :text) }

      it { should eql '<p>Hello!</p>' }
    end

    context "with the key list being an array" do
      before { I18n.stub('translate').with('list', anything()).and_return(['item1', 'item2', 'item3']) }

      subject { action_view.t('list') }

      it { should eql "item1\nitem2\nitem3" }
    end
  end
end
