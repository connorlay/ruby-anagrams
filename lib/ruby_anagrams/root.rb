class Root < Node

  def initialize
    super
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
    word.chars.map { |c| c.to_sym }
  end

end