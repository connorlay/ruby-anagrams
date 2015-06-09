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
      add_to_subtree word.to_sym_a
    end

    alias :add :<<

    # If the trie contains the word.
    # @param word [String] the word to search for.
    # @return [Boolean] true if the word is found, false otherwise.
    def include? word
      search_subtree word.to_sym_a
    end

  end
end