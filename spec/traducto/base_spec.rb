require 'spec_helper'

describe Traducto::Base do

  describe "#translate" do
    before { allow(I18n).to receive_messages(translate: '') }

    context "with the key views.persons.index.welcome having a 'Hello!' value" do
      before { allow(I18n).to receive(:translate).with('views.persons.index.welcome', anything()) { 'Hello!' } }

      context "when calling from persons#index" do
        before do
          rails_helper = double()
          allow(rails_helper).to receive_messages(request: { controller: 'persons', action: 'index' })

          @base = Traducto::Base.new(rails_helper)
        end

        context "when asking the key 'views.persons.index.welcome'" do
          specify { expect(@base.translate('views.persons.index.welcome')).to eql 'Hello!' }
        end

        context "when asking the key 'persons.index.welcome'" do
          specify { expect(@base.translate('persons.index.welcome')).to eql '' }
        end

        context "when asking the key '.welcome'" do
          specify { expect(@base.translate('.welcome')).to eql 'Hello!' }
        end
      end

      context "when calling from persons#show" do
        before do
          rails_helper = double()
          allow(rails_helper).to receive_messages(request: { controller: 'persons', action: 'show' })

          @base = Traducto::Base.new(rails_helper)
        end

        context "when asking the key '.welcome'" do
          specify { expect(@base.translate('.welcome')).to eql '' }
        end

        context "with the key views.persons.title having a 'Human' value" do
          before { allow(I18n).to receive(:translate).with('views.persons.title', anything()) { 'Human' } }

          context "when asking the key '.title'" do
            specify { expect(@base.translate('.title')).to eql 'Human' }
          end
        end
      end
    end

    context "with the key intro having the value ['par1', 'par2', 'par3']" do
      before { allow(I18n).to receive(:translate).with('intro', anything()) { ['par1', 'par2', 'par3'] } }

      context "when translating the key 'intro' without a text format" do
        before { @base = Traducto::Base.new(ActionView::Base.new) }

        subject { @base.translate('intro') }

        it { should eql "par1\npar2\npar3" }
      end

      context "when translating the key 'intro' with a text format" do
        before { @base = Traducto::Base.new(ActionView::Base.new) }

        subject { @base.translate('intro', format: :text) }

        it { should eql '<p>par1</p><p>par2</p><p>par3</p>' }
      end
    end

    context "with the key task_list having the value ['item1', 'item2', 'item3']" do
      before { allow(I18n).to receive(:translate).with('task_list', anything()) { ['item1', 'item2', 'item3'] } }

      context "when translating the key 'task_list' with a list format" do
        before { @base = Traducto::Base.new(ActionView::Base.new) }

        subject { @base.translate('task_list', format: :list) }

        it { should eql '<ul><li>item1</li><li>item2</li><li>item3</li></ul>' }
      end
    end

  end
end
