module RubyAnagrams
  describe String do

    describe "#to_sym_a" do
      let(:string) { "apple" }
      it "returns a symbol array representing its characters" do
        expect(string.to_sym_a).to eq [:a, :p, :p, :l, :e]
      end
    end

  end
end