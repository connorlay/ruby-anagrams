module RubyAnagrams

  module Enumerable

    include ::Enumerable

    def each &block
      enumerator = Enumerator.new do |y|
        y << word if terminal?
        @children.each_value do |child|
          child.each { |word| y << word }
        end
      end
      block.nil? ? enumerator : enumerator.each(&block)
    end

    alias :size :count

  end

end