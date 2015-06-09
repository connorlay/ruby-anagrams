module RubyAnagrams
  describe Anagrams do

    let(:root) { Root.new "spec/assets/sample_dictionary.txt" }

    describe "#anagrams" do

      context "without wildcards" do
        let(:complete_anagrams) { root.anagrams "lead", partial: false }
        let(:partial_anagrams)  { root.anagrams "lead", partial: true }
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
        let(:complete_anagrams) { root.anagrams "b*t", partial: false }
        let(:partial_anagrams)  { root.anagrams "b*t", partial: true }
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

    describe ".sym_a_to_product" do
      let(:symbols) { [:a, :b, :c] }
      it "returns the product of its symbols" do
        expect(Anagrams.sym_a_to_product symbols).to be 30
      end
    end

    describe ".sym_a_permutations" do
      let(:symbols)      { [:b, :*, :*, :n] }
      let(:permutations) { [] }
      before do
        (:a..:z).each do |s1|
          (:a..:z).each do |s2|
            permutations << [s1, s2, :b, :n]
          end
        end
      end
      it "returns all permutations" do
        expect(Anagrams.sym_a_permutations symbols).to eq permutations
      end
    end

  end
end