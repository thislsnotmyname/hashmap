# JM, 09/06/2024
#
# This class creates the Nodes of a Linked List.
class Node
  attr_accessor :value, :next

  def initialize(value = nil, next_node = nil)
    @value = value
    @next = next_node
  end

  def to_s
    @value
  end
end
