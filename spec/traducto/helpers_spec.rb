require 'spec_helper'

describe Traducto::Helpers do
  describe "#t" do
    let(:action_view) { ActionView::Base.new }

    context "with the key welcome" do
      before { I18n.stub('translate').with('welcome', anything()).and_return('Hello!') }

      subject { action_view.t('welcome', format: :text) }

      it { should eql '<p>Hello!</p>' }
    end
  end
end
