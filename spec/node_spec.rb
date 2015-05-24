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

end