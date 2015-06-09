module RubyAnagrams
  # Provides subtree branching and searching behavior to the trie data strucutre.
  # @author Connor Lay
  module Subtrees

    # Returns the number of nodes in the subtree. When called on Root, returns
    # the number of nodes in the entire trie data structure.
    # @return [Integer] the number of nodes in the subtree.
    def node_count
      nodes = 1
      @children.each_value do |child|
        nodes += child.node_count
      end
      nodes
    end

    # Descends the trie data structure following the given sequence of symbols.
    # The last node visited is returned, either because it is a leaf or there
    # are no symbols left.
    # @note This method alters the symbol array.
    # @param symbols [Array<Symbol>] the symbol sequence to follow.
    # @return [Node] the last node visited.
    def descend symbols
      return self unless symbol = symbols[0]
      return self unless child = @children[symbol]
      symbols.slice! 0
      child.descend symbols
    end

  protected
    # Descends the trie data structure, adding nodes when needed, for a given
    # sequence of symbols. The last node visited is designated as a terminal.
    # @param symbols [Array<Symbol>] the symbol sequence to follow.
    # @return [String] the word represented by the last node visited.
    def add_to_subtree symbols
      current = descend symbols
      symbols.each do |symbol|
        current[symbol] = Node.new symbol, current
        current = current[symbol]
      end
      current.terminal!
      current.word
    end

    # Depth-first searches the trie data structure for a node representing a
    # given sequence of symbols.
    # @param symbols [Array<Symbol>] the symbol sequence to follow.
    # @return [Boolean] true if the last node visited is a terminal, false otherwise.
    def search_subtree symbols
      current = descend symbols
      current.terminal? && symbols.empty?
    end

  end
end