class Node
  attr_accessor :next
  attr_reader :data

  def initialize(data = nil)
    @data = data
    @next = nil
  end

  def to_s
    next_node = @next.nil? ? "nil" : @next.to_s
    "( #{@data} ) -> #{next_node}"
  end
end

class List
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
  end

  def prepend(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next = @head
      @head = node
    end
  end

  def size
    return 0 if @head.nil?
    size = 1
    self.each { size += 1 }
    size
  end

  def at(index)
    current = @head
    index.times do
      return nil if current.nil?
      current = current.next
    end
    current
  end

  def pop
    element = @tail
    @tail = self.at(self.size - 2)
    @tail.next = nil
    element
  end

  def each
    current = @head
    loop do
      yield(current)
      break if current.next.nil?
      current = current.next
    end
  end

  def contains?(data)
    self.each { |element| return true if element.data == data }
    return false
  end

  def find(data)
    index = 0
    self.each do |element|
      return index if element.data == data
      index += 1
    end
    return nil
  end

  def to_s
    @head.to_s
  end

  def insert_at(index, data)
    current_node = Node.new(data)
    previous_node = self.at(index - 1)
    next_node = previous_node.next
    previous_node.next = current_node
    current_node.next = next_node
  end

  def remove_at(index)
    previous_node = self.at(index - 1)
    previous_node.next = self.at(index + 1)
  end
end

a = List.new
a.append(Node.new("a"))
a.prepend(Node.new("c"))
a.insert_at(1, "d")
a.remove_at(2)
p a.to_s
