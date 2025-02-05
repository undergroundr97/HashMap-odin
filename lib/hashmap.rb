class HashMap
  attr_accessor :buckets
  def initialize(load_factor = 0.75 , capacity = 16)
    @loadfactor = load_factor
    @capacity = capacity
    @buckets = Array.new(@capacity) {[]}
  end
  def hash(key)
    hash_code = 0
    # prime_number = 104729 * 350381
    prime_number = 31
    key.each_char { |char| hash_code =  prime_number * hash_code + char.ord}
    hash_code
  end
  def set(key, value)
     index = hash(key) % @capacity
     bucket = @buckets[index]
     if bucket.empty?
      bucket << [key,value]
     else
      bucket[0][1] = value
     end
  end
  def get(key)
    index = hash(key) % @capacity
    bucket = @buckets[index]
    bucket[0][1]
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
p hash.get_value('hash')
p hash.buckets