module Anagrams
  describe Root do
    subject { Root.new }

    describe "#str_to_sym_a" do
      it "creates a symbol array from a word" do
        expect(subject.str_to_sym_a "apple").to eq [ :a, :p, :p, :l, :e ]
      end
    end
  end
end