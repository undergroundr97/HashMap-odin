class HashMap
  attr_accessor :buckets
  def initialize(load_factor = 0.75 , capacity = 16)
    @loadfactor = load_factor
    @capacity = capacity
    @buckets = Array.new(@capacity) {[]}
    @count = 0
  end
  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code =  prime_number * hash_code + char.ord}
    hash_code
  end
  def set(key, value)
    if @count - 2 > @loadfactor * @capacity
      resize
    end
     index = hash(key) % @capacity
     bucket = @buckets[index]
     if bucket.empty?
      bucket << [key,value]
      @count += 1
     elsif !bucket.empty? 
      bucket.clear
      bucket << [key,value]
     end
  end
  def get(key)
    index = hash(key) % @capacity
    bucket = @buckets[index]
    bucket[0][1]
  end
  def has?(key)
    index = hash(key) % @capacity
    bucket = @buckets[index]
    p bucket
    bucket.empty? ? false : true
  end
  def remove(key)
    index = hash(key) % @capacity
    bucket = @buckets[index]
    if has?(key)
      del1 = bucket[0][0]
      del2 = bucket[0][1]
      puts "Deleted key: #{del1}, value: #{del2}. "
      bucket[0].pop
      bucket[0].pop
      # del1, del2
    else
      puts "Key not found"
    end
    bucket.clear
    @count -= 1
  end
  def length 
    @count
  end
  def clear
    initialize(0.75, 16)
  end
  def keys
    all_keys = []
    @buckets.each do |val|
      if !val.empty?
         all_keys << val[0][0]  
      end 
    end
    p all_keys
  end
  def values 
    all_values = []
    @buckets.each do |val|
      if !val.empty?
        all_values << val[0][1]
      end
    end
    all_values
  end
  def entries
    all_entries = []
    @buckets.each do |val|
      if !val.empty?
        all_entries << val
      end
    end
    all_entries
  end
  def resize
      new_capacity = @capacity * 2
      new_buckets = Array.new(new_capacity) {[]}
      @buckets.each do |bucket|
        bucket.each do |key,value|
          new_index = hash(key) % new_capacity
          new_buckets[new_index] << [key,value]
        end
      end
      @capacity = new_capacity
      @buckets = new_buckets
    end
  
end

# hash = HashMap.new

