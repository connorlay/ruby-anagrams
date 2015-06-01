module RubyAnagrams
  describe Subtrees do

    describe "#<<" do

      subject { Root.new }

      context "creating a new subtree" do
        before do
          subject << "apple"
        end
        it { is_expected.to include "apple" }
        its(:node_count) { is_expected.to be 6 }
      end

      context "adding to an existing subtree" do
        before do
          subject << "apple"
          subject << "app"
        end
        it { is_expected.to include "apple" }
        it { is_expected.to include "app" }
        its(:node_count) { is_expected.to be 6 }
      end

      context "extending an existing subtree" do
        before do
          subject << "app"
          subject << "apple"
        end
        it { is_expected.to include "apple" }
        it { is_expected.to include "app" }
        its(:node_count) { is_expected.to be 6 }
      end

      context "forking from an existing subtree" do
        before do
          subject << "apple"
          subject << "apricot"
        end
        it { is_expected.to include "apple" }
        it { is_expected.to include "apricot" }
        its(:node_count) { is_expected.to eq 11 }
      end
    end

  end
end