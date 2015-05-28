module Anagrams

  module Subtrees

    def node_count
      n = 1
      self.children.each_value do |child|
        n += child.node_count
      end
      n
    end

    protected

      def add_to_subtree symbols
        if symbols.empty?
          terminal!
          return word
        end
        s = symbols.slice! 0
        unless child = self[s]
          child = Node.new s, self
          self[s] = child
        end
        child.add_to_subtree symbols
      end

      def search_subtree symbols
        return true if symbols.empty? && terminal?
        s = symbols.slice! 0
        return false unless child = self[s]
        child.search_subtree symbols
      end

  end

end