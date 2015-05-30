module Anagrams

  class Node

    include Subtrees
    include Enumerable
    include Anagrams

    attr_reader :symbol, :children, :parent

    def initialize symbol = nil, parent = nil
      @symbol = symbol
      @parent = parent
      @children = {}
      @terminal = false
    end

    def []= symbol, child
      @children[symbol] = child
    end

    def [] symbol
      @children[symbol]
    end

    def terminal!
      @terminal = true
    end

    def terminal?
      @terminal
    end

    def word
      @parent ? "#{@parent.word}#{@symbol}" : "#{@symbol}"
    end

  end

end