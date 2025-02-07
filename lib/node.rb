require_relative 'custom_enumerables'
class Node 
  attr_accessor :value, :next_node
  include Enumerable
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
