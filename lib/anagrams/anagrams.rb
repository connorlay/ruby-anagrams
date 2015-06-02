module RubyAnagrams
  # Provides anagram solver behavior to the trie data structure.
  # @author Connor Lay
  module Anagrams
    require 'prime'

    # A Hash associating symbols with unique prime numbers.
    SYM_PRIMES = (:a..:z).to_a.zip(Prime.first(26)).to_h

    # Returns all words in the trie data structure that are anagrams
    # of the string provided. "*" indicates a wildcard.
    # @note Default behavior finds complete anagrams that use every character
    #   in the string. Partial anagrams can be included by setting include_partial
    #   to true.
    # @example without partial anagrams
    #   root << "rise"
    #   root << "sire"
    #   root << "rie"
    #   #anagrams "rise" #=> ['rise', 'sire']
    # @example with partial anagrams
    #   root << "rise"
    #   root << "sire"
    #   root << "rie"
    #   #anagrams "rise", include_partial: true #=> ['rie', 'rise', 'sire']
    # @example with wildcards
    #   root << "bin"
    #   root << "ban"
    #   root << "bun"
    #   #anagrams "b*n" #=> ['ban', 'bin', 'bun']
    # @param string [String] the string to find anagrams of.
    # @param include_partial [Boolean] include partial anagrams?
    # @return [Array<String>] all anagrams of the given string.
    def anagrams string, include_partial: false
      symbols = str_to_sym_a string
      anagrams = []
      find_symbol_permutations(symbols).each do |permutation|
        anagrams.concat find_anagrams(as_product(permutation), include_partial: include_partial)
      end
      anagrams.uniq.sort
    end

    protected
      # Returns anagrams in the trie data structure by performing depth-first search,
      # following subtrees whose symbol's associated prime number is a prime factor
      # of the product representing a string. The words of visited terminal nodes
      # are returned as an array.
      # @note Default behavior finds words that consume all prime factors
      #   of the given product. Words that do not consume all prime factors can
      #   be included by setting include_partial to true.
      # @param product [Integer] the product representing the string to find
      #   anagrams of.
      # @param include_partial [Boolean] include partial anagrams?
      # @return [Array<String>] all anagrams whose product divides into the given
      #   product.
      def find_anagrams product, include_partial: false
        anagrams = []
        anagrams << word if terminal? && (include_partial ? true : product == 1)
        @children.each do |symbol,child|
          if product % SYM_PRIMES[symbol] == 0
            anagrams += child.find_anagrams(product / SYM_PRIMES[symbol], include_partial: include_partial)
          end
        end
        anagrams
      end

      # Returns all permutations of the given set of symbols, where "*" wildcards
      # are replaced with all possible permutations of symbols in the trie's
      # alphabet.
      # @example with 1 wildcard
      #   alphabet = [:a, :b, :c]
      #   #find_symbol_permutations [:a, :*, :c] #=> [[:a, :a, :c], [:a, :b, :c], [:a, :c, :c]]
      # @param symbols [Array<Symbol>] the symbols to permute.
      # @return [Array<Array<Symbol>>] all permutations of the symbols.
      def find_symbol_permutations symbols
        symbol_permutations = []
        non_wild_symbols = symbols.reject{|s| s == :*}
        (:a..:z).to_a.repeated_permutation(symbols.count :*).each do |permutation|
          symbol_permutations << non_wild_symbols + permutation
        end
        symbol_permutations.empty? ? [symbols] : symbol_permutations
      end

      # Returns the product of each symbol's associated prime number.
      # @param symbols [Array<Symbol>] the symbols to multiply.
      # @return [Integer] the product of each symbol's associated prime number.
      def as_product symbols
        symbols.inject(1) { |acc,sym| acc * SYM_PRIMES[sym] }
      end

  end
end