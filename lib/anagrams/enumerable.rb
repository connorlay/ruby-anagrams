module RubyAnagrams
  # Provides enumerable behavior to the trie data structure.
  # @author Connor Lay
  module Enumerable

    include ::Enumerable

    # Calls a block for each word in the trie data strucutre. If no block is given,
    # an Enumerator is returned.
    # @return [Enumerator] the enumerator for the words in the trie data structure.
    def each &block
      enumerator = Enumerator.new do |yielder|
        yielder << word if terminal?
        @children.each_value { |child| child.each { |word| yielder << word } }
      end
      block.nil? ? enumerator : enumerator.each(&block)
    end

    alias :size :count

  end

end