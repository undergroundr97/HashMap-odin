module Enumerable
  def my_each_with_index
    index = 0 
    self.my_each do |item|
      yield item, index
      index += 1
    end
  end
  def my_select
    arr = []
    self.my_each do |item|
     arr << item if yield(item)
    end
    arr
  end
  def my_all?
    # tof = false
    arr_self = self
    arr_to_compare = []
    self.my_each do |item|
      arr_to_compare << item if yield(item)
    end
    p arr_to_compare
    p arr_self
     arr_self == arr_to_compare ? true : false
  end
  def my_any?
    arr_holder = []
    self.my_each do |item|
      arr_holder << item if yield(item)
    end
    p arr_holder
    # p self 
     if arr_holder == []
       false
     else
        true
     end
  end
  def my_none?
    arr_holder = []
    self.my_each do |item|
      arr_holder << item if yield(item)
    end
    p arr_holder
    if arr_holder == []
      true
    else
      false
    end
  end
  def my_count
    if block_given?
      arr_holder = []
      self.my_each do |item|
        arr_holder << item if yield(item)
      end
      arr_holder.size
    else
      self.size
    end
  end
  def my_map 
    if block_given?
      arr_holder = []
      self.my_each do |item|
        arr_holder << yield(item)
      end
       arr_holder
    end
  end
  def my_inject(initial_value)
    
    total = initial_value
    self.my_each do |item|
      total = yield(total, item)
    end
    total
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for item in self
      yield item
    end
  end
end
