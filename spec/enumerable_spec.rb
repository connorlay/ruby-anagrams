module RubyAnagrams

  describe Enumerable do

    let(:root)  { Root.new }
    let(:words) { %w[ here are some awesome words ] }
    before { words.each { |word| root << word } }

    describe "#each" do
      it "is an instance of Enumerator" do
        expect(root.each).to be_an_instance_of Enumerator
      end
      it "enumerates the words in the trie" do
        root.each { |word| expect(words).to include word }
        expect(root.size).to be words.size
      end
    end

    describe "#size" do
      it "delegates #count to #size" do
        expect(root.size).to be root.count
      end
    end

  end
end