module RubyAnagrams
  # A representation of a Node in the trie data structure.
  # @author Connor Lay
  class Node

    include Subtrees
    include Enumerable
    include Anagrams

    attr_reader :symbol, :children, :parent

    # Creates a new, non-terminal node with no children.
    # @param symbol [Symbol, nil] the symbol the node represents.
    # @param parent [Node, nil] the parent of the node.
    # @return [Node] the node just created.
    def initialize symbol = nil, parent = nil
      @symbol = symbol
      @parent = parent
      @children = {}
      @terminal = false
    end

    # Adds a new child node representing a symbol to this node's children.
    # @param symbol [Symbol] the symbol the node represents.
    # @param child [Node] the node to add as a child.
    # @return [Node] the node just added.
    def []= symbol, child
      @children[symbol] = child
    end

    # Returns the child node associated with a symbol.
    # @param symbol [Symbol]
    # @return [Node] the child node associated with the symbol.
    def [] symbol
      @children[symbol]
    end

    # Sets the node as a terminal.
    def terminal!
      @terminal = true
    end

    # Is the node a terminal?
    # @return [Boolean] true if the node is a terminal, false otherwise
    def terminal?
      @terminal
    end

    # Returns the word the node represents based on its symbol and
    # the symbols of its parents.
    # @example called on the node representing :e
    #   :a
    #     :p
    #       :p
    #         :l
    #           :e
    #   #word #=> "apple"
    # @return [String] the word the node represents.
    def word
      @parent ? "#{@parent.word}#{@symbol}" : "#{@symbol}"
    end

    def inspect
      "<#{self.class}:#{self.object_id}, "\
      "@symbol=#{@symbol ? ":#{@symbol}" : "nil"}, "\
      "@word=#{terminal? ? word : "nil"}, "\
      "@children=#{@children.each_key.to_a}>"
    end

  end
end