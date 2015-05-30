module Anagrams
  describe Anagrams do

    let(:root) { Root.new "assets/scrabble_dictionary.txt" }

    describe "#anagrams" do

      context "include partial anagrams" do
        it "finds all partial anagrams" do
          expect(root.anagrams "pine", partial: true).to eq %w[ en epin in inep ne nip pe
                                                                pein pen peni pi pie pin pine ]
        end
      end

      context "exclude partial anagrams" do
        it "finds all complete anagrams" do
          expect(root.anagrams "pine", partial: false).to eq %w[ epin inep pein peni pine ]
        end
      end

    end

  end
end