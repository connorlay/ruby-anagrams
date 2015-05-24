class Trie
  attr_reader :root, :word_count, :node_count

  def initialize path = nil
    @root = Node.new
    @word_count = 0
    @node_count = 1
    if path
      file = File.open path, "r"
      file.each { |line| self << line.downcase.strip }
      file.close
    end
  end

  def << word
    current = @root
    word.each_char do |c|
      c = c.to_sym
      unless child = current[c]
        child = Node.new c, current
        current[c] = child
        @node_count += 1
      end
      current = child
    end
    unless current.terminal?
      current.terminal!
      @word_count += 1
    end
    word
  end

  def include? word
    current = @root
    word.each_char do |c|
      false if current.nil?
      current = current[c.to_sym]
    end
    current.word == word
  end

  def to_s
    @root.to_s
  end

end