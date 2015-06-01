module Anagrams
  class Root < Node

    def initialize path = nil
      super()
      if path
        file = File.open path, "r"
        file.each_line { |line| self << line.downcase.strip }
        file.close
      end
    end

    def << word
      symbols = str_to_sym_a word
      add_to_subtree symbols
    end

    def include? word
      symbols = str_to_sym_a word
      search_subtree symbols
    end

    def str_to_sym_a word
      word.chars.map { |char| char.to_sym }
    end

  end
end