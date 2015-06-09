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

    describe "#descend" do

      let(:root) { Root.new }
      before     { root << "app" }
      context "descending to a leaf node" do
        it "returns the leaf node" do
          expect(root.descend [:a, :p, :p]).to be root[:a][:p][:p]
        end
      end

      context "descending beyond a leaf node" do
        let(:symbols) { [:a, :p, :p, :l, :e] }
        it "returns the leaf node with symbols in tact" do
          expect(root.descend symbols).to be root[:a][:p][:p]
          expect(symbols).to eq [:l, :e]
        end
      end

      context "descending before a lead node" do
        it "returns a node in the middle of the tree" do
          expect(root.descend [:a, :p]).to be root[:a][:p]
        end
      end

    end

  end
end