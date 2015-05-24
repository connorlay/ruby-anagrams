class Node
  attr_reader :symbol, :children, :parent

  def initialize symbol = nil, parent = nil
    @terminal = false
    @children = {}
    @parent = parent
    @symbol = symbol
  end

  def []= symbol, child
    @children[symbol] = child
  end

  def [] symbol
    @children[symbol]
  end

  def word
    @parent ? "#{@parent.word}#{@symbol}" : "#{@symbol}"
  end

  def terminal!
    @terminal = true
  end

  def terminal?
    @terminal
  end

  def to_s indent = ""
    s = "#{indent}#{@symbol}: #{@terminal ? word : nil}\n"
    @children.each_value do |child|
      s << child.to_s(indent + " ")
    end
    s
  end

end