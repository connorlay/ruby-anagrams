module RubyAnagrams
  # Provides anagram solver behavior to the trie data structure.
  # @author Connor Lay
  module Anagrams
    require 'prime'

    # A Hash associating symbols with unique prime numbers.
    SYM_PRIMES = (:a..:z).to_a.zip(Prime.first(26)).to_h

    class << self
      # Returns the product of each symbol's associated prime number.
      # @param symbols [Array<Symbol>] the symbols to multiply.
      # @return [Integer] the product of each symbol's associated prime number.
      def sym_a_to_product symbols
        symbols.inject(1) { |acc,sym| acc * SYM_PRIMES[sym] }
      end

      # Returns all permutations of a symbol array, where "*" wildcards
      # are replaced with symbols in the trie's alphabet.
      # @param symbols [Array<Symbol>] the symbols to permute.
      # @return [Array<Array<Symbol>>] the permutations.
      def sym_a_permutations symbols
        permutations = []
        base_symbols = symbols.reject { |s| s == :* }
        wildcard_permutations = (:a..:z).to_a.repeated_permutation(symbols.count :*)
        wildcard_permutations.each do |permutation|
          permutations << permutation.concat(base_symbols)
        end
        permutations.empty? ? [symbols] : permutations
      end
    end

    # Returns all string anagrams of the given symbol array by calling
    # #anagrams_by_product on all permutations of the symbol array.
    # @note Default behavior only includes complete anagrams. Partial anagrams
    #   can be included by setting partial to true.
    # @param symbols [Array<Symbol>] the symbols to find anagrams for.
    # @param partial [Boolean] include partial anagrams?
    # @return [Array<Array<String>>] all anagrams of the symbols.
    def search_for_anagrams symbols, partial: partial
      anagrams = []
      Anagrams.sym_a_permutations(symbols).each do |permutation|
        product = Anagrams.sym_a_to_product permutation
        anagrams.concat anagrams_by_product(product, partial: partial)
      end
      anagrams.uniq.sort
    end

    # Depth-first searches the trie data structure for anagrams based on their
    # node's associated prime number. Returns an array of anagrams whose product
    # divides into the given product.
    # @note Default behavior only includes words with a product equal to the
    #   given product. Words that are divisors of the given product can be
    #   included by setting partial to true.
    # @param product [Integer] a product of a symbol array.
    # @param partial [Boolean] include partial anagrams?
    # @return [Array<String>] all anagrams of the given product.
    def anagrams_by_product product, partial: partial
      anagrams = []
      anagrams << word if terminal? && (partial ? true : product == 1)
      @children.each do |symbol,child|
        if product % SYM_PRIMES[symbol] == 0
          anagrams += child.anagrams_by_product(product / SYM_PRIMES[symbol], partial: partial)
        end
      end
      anagrams
    end

  end
end