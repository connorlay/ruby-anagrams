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
      symbols = word.to_sym_a
      add_to_subtree symbols
    end

    alias :add :<<

    # If the trie contains the word.
    # @param word [String] the word to search for.
    # @return [Boolean] true if the word is found, false otherwise.
    def include? word
      symbols = word.to_sym_a
      search_subtree symbols
    end

    alias :contains? :include?

    # Returns all anagrams of the given word. Wildcards are indicated with "*".
    # @note Default behavior only includes complete anagrams. Partial anagrams
    #   can be included by setting partial to true.
    # @example without partial anagrams
    #   root << "rise"
    #   root << "sire"
    #   root << "rie"
    #   #anagrams "rise" #=> ['rise', 'sire']
    # @example with partial anagrams
    #   root << "rise"
    #   root << "sire"
    #   root << "rie"
    #   #anagrams "rise", partial: true #=> ['rie', 'rise', 'sire']
    # @example with wildcards
    #   root << "bin"
    #   root << "ban"
    #   root << "bun"
    #   #anagrams "b*n" #=> ['ban', 'bin', 'bun']
    # @param word [String] the word to find anagrams for.
    # @param partial [Boolean] include partial anagrams?
    # @return [Array<String>] anagrams of word.
    def anagrams word, partial: false
      symbols = word.to_sym_a
      search_for_anagrams symbols, partial: partial
    end

  end
end