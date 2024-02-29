class LinkedLists
  attr_accessor :head

  def initialize
    self.head = nil
  end

  def append(value)
    if head.nil?
      self.head = Nodes.new(value)
    else
      lastNode = head
      lastNode = lastNode.nextNode until lastNode.nextNode.nil?
      lastNode.nextNode = Nodes.new(value)
    end
  end

  def prepend(value)
    if head.nil?
      self.head = Nodes.new(value)
    else
      lastNode = Nodes.new(value)
      lastNode.nextNode = head

      self.head = lastNode
    end
  end

  def size(temp = 1)
    return 0 if head.nil?

    lastNode = head
    until lastNode.nextNode.nil?
      temp += 1
      lastNode = lastNode.nextNode
    end

    temp
  end

  def heading
    return nil if head.nil?

    lastNode = head
  end

  def tailing(temp = 0)
    return nil if head.nil?

    lastNode = head
    until lastNode.nextNode.nil?
      temp += 1
      lastNode = lastNode.nextNode
    end

    lastNode
  end

  def at_index(value, temp = 0)
    lastNode = head
    return lastNode if value == 0

    until lastNode.nextNode.nil?
      temp += 1
      return lastNode.nextNode if temp == value

      lastNode = lastNode.nextNode
    end
  end

  def pop
    return nil if head.nil?

    lastNode = head
    until lastNode.nextNode.nil?
      tempNode = lastNode
      lastNode = lastNode.nextNode
    end
    tempNode.nextNode = nil
    self
  end

  def contains?(values)
    lastNode = head
    until lastNode.nextNode.nil?
      return true if lastNode.value == values

      lastNode = lastNode.nextNode
      return true if lastNode.value == values
    end
    false
  end

  def find(values, temp = 0)
    lastNode = head
    until lastNode.nextNode.nil?
      temp += 1
      return temp if lastNode.value == values

      lastNode = lastNode.nextNode
    end
    return temp if lastNode.value == values

    'nil'
  end

  def to_string(arr = [])
    lastNode = head
    until lastNode.nextNode.nil?
      arr.push(lastNode.value)
      lastNode = lastNode.nextNode
    end
    arr.push(lastNode.value)
    arr.push(lastNode.nextNode)
    result = ''
    arr.each_with_index do |value, index|
      result += "(#{value})"
      result += '->' unless index == arr.length - 1
    end
    result
  end

  def insert_at(value, index, temp = 0)
    lastNode = head
    if index == 0
      lastNode = Nodes.new(value)
      lastNode.nextNode = head
      self.head = lastNode
      return self
    end
    until lastNode.nextNode.nil?
      if index == temp
        tempNode = Nodes.new(value)
        tempNode.nextNode = lastNode
        head.nextNode = tempNode
        return self
      end
      temp += 1
      lastNode = lastNode.nextNode
    end
  end

  def remove_at(index, temp = 0)
    lastNode = head
    if index == 0
      tempNode = lastNode.nextNode
      self.head = tempNode
      return self
    end
    until lastNode.nextNode.nil?
      if index == temp
        tempNode = lastNode.nextNode
        head.nextNode = tempNode
        return self
      end
      lastNode = lastNode.nextNode
      temp += 1
    end
  end

  class Nodes
    attr_accessor :value, :nextNode

    def initialize(value, _nextNode = nil)
      self.value = value
      self.nextNode = nil
    end
  end
end

ll = LinkedLists.new
ll.prepend(10)
ll.append(20)
ll.append(30)
ll.append(40)
#  ll.size()
# ll.heading()
#  ll.tailing()
# ll.at_index(3)
# ll.pop()
# ll.contains?(50)
# ll.find(450)
# ll.to_string()
# ll.insert_at(60,0)
p ll.remove_at(0)
