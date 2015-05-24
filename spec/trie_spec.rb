describe Trie do

  subject { Trie.new }

  describe ".new" do
    context "without parameters" do
      it { is_expected.to be_an_instance_of Trie }
      its(:node_count) { is_expected.to eq 1 }
      its(:word_count) { is_expected.to eq 0 }
    end
    context "with parameters" do
      subject { Trie.new "assets/sample_dictionary.txt"}
      it { is_expected.to be_an_instance_of Trie }
      its(:node_count) { is_expected.to eq 22}
      its(:word_count) { is_expected.to eq 5 }
    end
  end

  describe "#<<" do
    context "when empty" do
      before { subject << "mango" }
      it { is_expected.to include "mango" }
      its(:node_count) { is_expected.to eq 6 }
      its(:word_count) { is_expected.to eq 1 }
    end

    context "when extending a branch" do
      before do
        subject << "pine"
        subject << "pineapple"
      end
      it { is_expected.to include "pine" }
      it { is_expected.to include "pineapple" }
      its(:node_count) { is_expected.to eq 10 }
      its(:word_count) { is_expected.to eq 2 }
    end

    context "when forking from a branch" do
      before do
        subject << "avocado"
        subject << "apricot"
      end
      it { is_expected.to include "avocado" }
      it { is_expected.to include "apricot" }
      its(:node_count) { is_expected.to eq 14 }
      its(:word_count) { is_expected.to eq 2 }
    end
  end
end