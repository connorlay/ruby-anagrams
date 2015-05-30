module Anagrams

  module Anagrams

    require 'prime'

    CHAR_PRIMES = (:a..:z).to_a.zip(Prime.first(26)).to_h

    def anagrams word, partial: false
      symbols = str_to_sym_a word
      find_anagrams as_product(symbols), partial: partial
    end

    protected

      def find_anagrams product, partial: false
        anagrams = []
        anagrams << word if terminal? && partial ? true : product == 1
        @children.each do |symbol,child|
          if product % CHAR_PRIMES[symbol] == 0
            anagrams += child.find_anagrams(product / CHAR_PRIMES[symbol], partial: partial)
          end
        end
        anagrams
      end

      def as_product symbols
        symbols.inject(1) { |acc,sym| acc * CHAR_PRIMES[sym] }
      end

  end

end