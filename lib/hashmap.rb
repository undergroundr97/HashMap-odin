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
    prime_number = 104729 * 350381
    # prime_number = 31
    key.each_char { |char| hash_code =  prime_number * hash_code + char.ord}
    hash_code
  end
  def set(key, value)
     index = hash(key) % @capacity
     bucket = @buckets[index]
     if bucket.empty?
      bucket << [key,value]
      @count += 1
     else
      bucket[0][1] = value
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
    @buckets.each do |pair|
      if !pair.empty?
         all_keys << pair[0][0]  
      end 
    end
    p all_keys
  end
end

hash = HashMap.new

# p hash.hash('vitor')
# p hash.set('vITOR')
p hash.set('odin', 20323)
p hash.set('odin', 233)
p hash.set('odin', 533)
p hash.set('vitor', 533)
p hash.set('pedro', 533)
p hash.set('hash', 533)
p hash.get('hash')
# p hash.has?('')
  hash.remove('hash')
p hash.buckets

p hash.length
# p hash.clear
p hash.buckets

p hash.keys