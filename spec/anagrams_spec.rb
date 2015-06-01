module Anagrams
  describe Anagrams do

    let(:root) { Root.new "spec/assets/sample_dictionary.txt" }

    describe "#anagrams" do

      context "without wildcards" do
        let(:complete_anagrams) { root.anagrams "lead", include_partial: false }
        let(:partial_anagrams)  { root.anagrams "lead", include_partial: true }
        let(:correct_anagrams)  { %w[ ad ae al ale dal dale de deal del
                                      ed el eld la lad lade lea lead led ] }

        it "finds all partial anagrams" do
          expect(partial_anagrams).to eq correct_anagrams
        end
        it "finds all complete anagrams" do
          expect(complete_anagrams).to eq correct_anagrams.reject{ |anagram| anagram.length != 4 }
        end
        it "only finds anagrams in the trie" do
          partial_anagrams.each { |anagram| expect(root.include? anagram) }
        end
      end

      context "with wildcards" do
        let(:complete_anagrams) { root.anagrams "b*t", include_partial: false }
        let(:partial_anagrams)  { root.anagrams "b*t", include_partial: true }
        let(:correct_anagrams)  { %w[ ab at ba bat be bet bi bit bo bot
                                      but by et it ta tab ti to tub ut ] }

        it "finds all partial anagrams" do
          expect(partial_anagrams).to eq correct_anagrams
        end
        it "finds all complete anagrams" do
          expect(complete_anagrams).to eq correct_anagrams.reject{ |anagram| anagram.length != 3 }
        end
        it "only finds anagrams in the trie" do
          partial_anagrams.each { |anagram| expect(root.include? anagram) }
        end
      end
    end

  end
end