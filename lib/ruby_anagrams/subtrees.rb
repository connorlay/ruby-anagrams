module Anagrams

  module Subtrees

    def node_count
      nodes = 1
      @children.each_value do |child|
        nodes += child.node_count
      end
      nodes
    end

    def add_to_subtree symbols
      if symbols.empty?
        terminal!
        return word
      end
      s = symbols.slice! 0
      unless child = @children[s]
        child = Node.new s, self
        @children[s] = child
      end
      child.add_to_subtree symbols
    end

    def search_subtree symbols
      return true if symbols.empty? && terminal?
      s = symbols.slice! 0
      return false unless child = @children[s]
      child.search_subtree symbols
    end

  end

end