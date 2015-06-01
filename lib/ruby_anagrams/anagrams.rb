module Anagrams
  module Anagrams

    require 'prime'

    CHAR_PRIMES = (:a..:z).to_a.zip(Prime.first(26)).to_h

    def anagrams word, include_partial: false
      symbols = str_to_sym_a word
      anagrams = []
      find_symbol_permutations(symbols).each do |permutation|
        anagrams.concat find_anagrams(as_product(permutation), include_partial: include_partial)
      end
      anagrams.uniq.sort
    end

    protected

      def find_anagrams product, include_partial: false
        anagrams = []
        anagrams << word if terminal? && (include_partial ? true : product == 1)
        @children.each do |symbol,child|
          if product % CHAR_PRIMES[symbol] == 0
            anagrams += child.find_anagrams(product / CHAR_PRIMES[symbol], include_partial: include_partial)
          end
        end
        anagrams
      end

      def find_symbol_permutations symbols
        symbol_permutations = []
        non_wild_symbols = symbols.reject{|s| s == :*}
        (:a..:z).to_a.repeated_permutation(symbols.count :*).each do |permutation|
          symbol_permutations << non_wild_symbols + permutation
        end
        symbol_permutations.empty? ? [symbols] : symbol_permutations
      end

      def as_product symbols
        symbols.inject(1) { |acc,sym| acc * CHAR_PRIMES[sym] }
      end

  end
end