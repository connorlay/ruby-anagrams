module RubyAnagrams
  describe Node do

    describe "#new" do
      context "without parameters" do
        subject { Node.new }

        it             { is_expected.to be_an_instance_of Node }
        its(:symbol)   { is_expected.to be_nil }
        its(:parent)   { is_expected.to be_nil }
        its(:children) { are_expected.to be_empty }
      end

      context "with parameters" do
        let(:parent) { Node.new }
        subject      { Node.new :a, parent }

        it             { is_expected.to be_an_instance_of Node }
        its(:symbol)   { is_expected.to be :a }
        its(:parent)   { is_expected.to be parent }
        its(:children) { are_expected.to be_empty }
      end
    end

    describe "#[]" do
      subject     { Node.new }
      let(:child) { Node.new :a, subject }

      context "without children" do
        before { subject[:a] = child }
        it "has 1 child" do
          expect(subject.children.size).to be 1
        end
        it "has the correct child" do
          expect(subject[:a]).to be child
        end
      end

      context "with children" do
        before do
          (:a..:z).each { |s| subject[s] = Node.new(s, subject) }
          subject[:a] = child
        end
        it "has 26 children" do
          expect(subject.children.size).to be 26
        end
        it "overwrites an existing child with a new one" do
          expect(subject[:a]).to be child
        end
      end
    end

  end
end