describe Node do

  subject { Node.new }

  describe ".new" do
    it { is_expected.to be_an_instance_of Node }
    it { is_expected.not_to be_a_terminal }
    its(:children) { are_expected.to be_empty }

    context "without parameters" do
      its(:parent) { is_expected.to be nil }
      its(:symbol) { is_expected.to be nil }
    end

    context "with parameters" do
      let(:parent) { Node.new }
      subject { Node.new :a, parent }
      its(:parent) { is_expected.to be parent }
      its(:symbol) { is_expected.to eq :a }
    end
  end

  describe "#add_child" do
    let(:child) { Node.new }
    before { subject[:a] = child }
    it "has the child" do
      expect(subject[:a]).to be child
    end
  end

  describe "#word" do
    context "without parents" do
      it "does not have a word" do
        expect(subject.word).to be_empty
      end
    end

    context "with parents" do
      let(:b) { Node.new :b }
      let(:o) { Node.new :o, b }
      let(:a) { Node.new :a, o }
      subject { Node.new :t, a }
      it "has a word" do
        expect(subject.word).to eq "boat"
      end
    end
  end

  describe "#to_s" do
    before do
      subject[:b]             = Node.new :b, subject
      subject[:b][:o]         = Node.new :o, subject[:b]
      subject[:b][:o][:a]     = Node.new :a, subject[:b][:o]
      subject[:b][:o][:a][:t] = Node.new :t, subject[:b][:o][:a]
      subject[:b][:o][:a][:t].terminal!
    end
    it "represents its subtree as a string" do
      expect(subject.to_s).to eq ": \n b: \n  o: \n   a: \n    t: boat\n"
    end
  end

end