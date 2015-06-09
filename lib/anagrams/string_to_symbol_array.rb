class String
  # Returns a symbol array representation of the reciever's characters.
  # @example
  #   "apple".to_sym_a #=> [:a, :p, :p, :l, :e]
  # @return [Array<Symbol>] an array of symbols
  def to_sym_a
    self.chars.map { |char| char.to_sym }
  end
end
