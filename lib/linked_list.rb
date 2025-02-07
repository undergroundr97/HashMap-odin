require_relative 'node'
require_relative 'custom_enumerables'
class LinkedList
  attr_accessor :head, :count
  def initialize(node)
    @head = Node.new(node)
    @count = 1
  end
  def append(node)
    current_node = @head
    while current_node.next_node != nil
      current_node = current_node.next_node
    end
    current_node.next_node = Node.new(node, nil)
    @count += 1
  end
  def prepend(node)
     @head = Node.new(node, @head)
     @count += 1
  end
  def size
    @count
  end
  def head
    @head.value
  end
  def tail
    current_node = @head
    while current_node.next_node != nil
      current_node = current_node.next_node
    end
    tail = current_node.value
    tail
  end
  def at(index)
    if index > @count - 1
      nil
    else
      to_find = 0
       current_node = @head
      while to_find != index
        current_node = current_node.next_node
        to_find += 1
      end
      node_value = current_node.value
      node_value
    end
  end
  def pop
    return nil if @head.nil?
    if @head.next_node.nil?
      @head = nil
      return
    end
    current_node = @head
    while current_node.next_node && current_node.next_node.next_node
      current_node = current_node.next_node
    end
    current_node.next_node = nil 
    @count -= 1    
  end
  def contains?(value)
    current_node = @head
    tof = false
    while current_node.next_node != nil
      current_node = current_node.next_node
      if current_node.value == value
        tof = true
      end
      
    end
    tof
  end
  def find(value)
    if self.contains?(value)
      current_node = @head
      count = 0 
      while current_node.next_node != nil
        count += 1
        current_node = current_node.next_node
        if current_node.value == value
          count
        end
      end
      count
    else
      nil   
    end 
  end
  def to_s
    current_node = @head
    string_output = ""
    while current_node != nil
      string_output += "( #{current_node.value } ) -> "
      current_node = current_node.next_node
    end
      string_output += 'nil'
      string_output
  end
  ## extra credit TOP
  def insert_at(index, value)
    if index > @count - 1 
      raise 'Cannot add item higher than index value'
    else
    current_node = @head
    to_find = 0
    while to_find != index
       current_node = current_node.next_node
      to_find+= 1
    end
    # current_node.next_node = Node.new(current_node.value, current_node.next_node)
    current_node.value = Node.new(value, current_node.next_node).value
    @count += 1
    end
  end
  def empty?
    @count == 0 ? true : false
  end
  
  def contains_key?(key)
    current_node = @head
    index = @count
    tof = false
    while index > 0
      if current_node.value[0] == key
        # p "minha chave e #{key}, e o valor atual e #{current_node.value[0]}, meu index atual e de #{index}"
        index
        tof = true
        break
      end
      index -= 1
      current_node = current_node.next_node
    end
    tof
  end
  def find_key(value)
     if self.contains_key?(value)
       current_node = @head
      index = 0 
      while index < @count
        if current_node.value[0] == value
          return index
        end
      index += 1
        current_node = current_node.next_node
        end
      index
     else
      nil
    end 
  end
  def change_value_at(index, key, value)
    current_node = @head
    to_find = 0
    until index == to_find
      current_node = current_node.next_node
      to_find += 1
    end
    current_node.value[1] = value
  end
end

