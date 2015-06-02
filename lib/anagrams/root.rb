# Namespace for the Ruby-Anagrams gem.
module RubyAnagrams
  # A representation of the Root node of the trie data structure.
  # @author Connor Lay
  class Root < Node
    # Creates a new trie.
    # @param path [String, nil] the path to a dictionary text file.
    # @return [Root] the Root node of the trie just created.
    def initialize path = nil
      super()
      if path
        file = File.open path, "r"
        file.each_line { |line| self << line.downcase.strip }
        file.close
      end
    end

    # Adds a word to the trie.
    # @param word [String] the new word to add to the trie.
    # @return [String] the word just added to the trie.
    def << word
      symbols = str_to_sym_a word
      add_to_subtree symbols
    end

    # If the trie contains the word.
    # @param word [String] the word to search for.
    # @return [Boolean] true if the word is found, false otherwise.
    def include? word
      symbols = str_to_sym_a word
      search_subtree symbols
    end

    # Returns a symbol array based on the chatacters of a string.
    # @example
    #   str_to_sym_a "apple" #=> [:a, :p, :p, :l, :e]
    # @param string [String] the string to process
    # @return [Array<Symbol>] an array of symbols
    def str_to_sym_a string
      string.chars.map { |char| char.to_sym }
    end

  end
end