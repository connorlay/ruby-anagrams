module RubyAnagrams
  describe Root do

    let(:path)      { "spec/assets/sample_dictionary.txt" }
    let(:text_file) { File.open(path).map(&:strip) }
    let(:words)     { %w[ these are some awesome words ] }
    let(:root)      { Root.new }

    describe "#new" do
      context "without parameters" do
        it "is an instance of Root" do
          expect(root).to be_an_instance_of Root
        end
      end

      context "with parameters" do
        let(:root) { Root.new path }

        it "contains the words from the text file" do
          root.each { |word| expect(text_file).to include word }
          expect(root.size).to be text_file.size
        end
      end
    end

    describe "#<<" do
      before { words.each { |word| root << word } }

      it "contains the words" do
        root.each { |word| expect(words).to include word }
        expect(root.size).to be words.size
      end
    end

    describe "#str_to_sym_a" do
      it "creates a symbol array from a word" do
        expect(subject.str_to_sym_a "apple").to eq [ :a, :p, :p, :l, :e ]
      end
    end

  end
end