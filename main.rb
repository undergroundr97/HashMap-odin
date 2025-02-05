require_relative 'lib/hashmap'

test = HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('frog','green')
test.set('hat','black')
test.set('ice cream', 'white')
test.set('jacket','blue')
test.set('kite', 'pink')
test.set('lion','golden')
test.set('lion3','golden')
test.set('lion2','golden')
test.set('lion4','golden')
test.set('lion5','golden')
p test.buckets
p test.length
# test.clear
p test.buckets
p test.has?('lion5')
p test.buckets_length
# p test.buckets