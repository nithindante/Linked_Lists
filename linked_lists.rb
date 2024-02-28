class LinkedLists
  attr_accessor :head
  def initialize()
      self.head =  nil
  end

  def append(value)
      if self.head == nil
        self.head = Nodes.new(value)
      else
        lastNode = self.head
        while(lastNode.nextNode != nil)
          lastNode = lastNode.nextNode
        end
        lastNode.nextNode = Nodes.new(value)
      end
  end

  def prepend(value)
      if self.head == nil
        self.head = Nodes.new(value)
      else
          lastNode = Nodes.new(value)
          lastNode.nextNode = self.head

          self.head  =  lastNode
      end
  end



  def size(temp = 1)
    if self.head == nil
      return 0
    else
      lastNode = self.head
      while(lastNode.nextNode !=  nil)
          temp = temp + 1
          lastNode = lastNode.nextNode
      end
    end
    return temp
  end

  def heading()
    if self.head == nil
      return nil
    else
      lastNode = self.head
    end
  end

  def tailing(temp = 0)
      if self.head == nil
        return nil
      else
        lastNode = self.head
        while(lastNode.nextNode !=  nil)
            temp = temp + 1
            lastNode = lastNode.nextNode
        end
      end
    return lastNode
  end


  def at_index(value,temp = 0)
    lastNode = self.head
    if value == 0
      return lastNode
    else
    while(lastNode.nextNode !=  nil)
        temp = temp + 1
        if temp == value
            return lastNode.nextNode
        end
        lastNode = lastNode.nextNode
    end
    end
  end


  def pop ()
      if self.head == nil
        return nil
      else
        lastNode = self.head
        while(lastNode.nextNode !=  nil)
            tempNode = lastNode
            lastNode = lastNode.nextNode
        end
        tempNode.nextNode = nil
        self
      end
  end

  def contains?(values)
      lastNode = self.head
      while(lastNode.nextNode !=  nil)
          if(lastNode.value==values)
            return true
          end
          lastNode = lastNode.nextNode
          if(lastNode.value==values)
            return true
          end
      end
      return false
  end

  def find(values,temp = 0)
      lastNode = self.head
      while(lastNode.nextNode !=  nil)
          temp = temp+1
          if(lastNode.value==values)
            return temp
          end
          lastNode = lastNode.nextNode
      end
      if(lastNode.value==values)
        return temp
      end
      return "nil"
  end

  def to_string(arr=[])
    lastNode = self.head
    while(lastNode.nextNode !=  nil)
    arr.push(lastNode.value)
    lastNode = lastNode.nextNode
    end
    arr.push(lastNode.value)
    arr.push(lastNode.nextNode)
    result = ""
    arr.each_with_index do |value, index|
     result += "(#{value.to_s})"
     result += "->" unless index == arr.length - 1  #|| value.nil?
    end
    return result
  end



   private
   class Nodes
      attr_accessor :value, :nextNode
     def initialize(value,nextNode=nil)
          self.value = value
          self.nextNode = nil
     end
   end
end

ll = LinkedLists.new()
ll.prepend(10)
ll.append(20)
ll.append(30)
 ll.append(40)
  ll.size()
  ll.heading()
  ll.tailing()
 ll.at_index(3)
  ll.pop()
  ll.contains?(50)
  ll.find(450)
 p ll.to_string()
