require_relative './linked_list/node'
require_relative './linked_list/aliases'
# JM, 09/06/2024
#
# This class handles the implementation of a Linked List.
class LinkedList
  include Aliases

  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    if @tail.nil?
      @tail = Node.new(value)
      @head = @tail if @head.nil?
    else
      @tail.next = @tail = Node.new(value)
    end
  end

  def prepend(value)
    if @head.nil?
      @head = Node.new(value)
      @tail = @head if @tail.nil?
    else
      @head = Node.new(value, @head)
    end
  end

  def size
    return 0 if @head.nil?

    each_with_index { |node, idx| return idx + 1 if node == @tail }
  end

  def at(index)
    each_with_index { |node, idx| return node.value if index == idx }
  end

  def []=(index, new_value)
    each_with_index { |node, idx| return node.value = new_value if index == idx }
  end

  def each
    current_node = @head
    loop do
      break if current_node.nil?

      yield(current_node)
      current_node = current_node.next
    end
  end

  def each_with_index
    index = 0
    each do |value|
      yield(value, index)
      index += 1
    end
  end

  def pop
    new_end_index = size - 2

    old_tail = @tail
    each_with_index do |node, idx|
      next unless idx == new_end_index

      node.next = nil
      @tail = node
      return old_tail
    end
  end

  def contains?(value)
    each do |val|
      return true if value == val.value
    end
    false
  end

  def find(value)
    each_with_index do |node, idx|
      return idx if value == node.value
    end
    nil
  end

  def insert_at(value, index)
    return prepend(value) if index.zero?
    return append(value) unless (1...size).include? index

    previous_node = @head
    each_with_index do |node, idx|
      if index == idx
        new_node = Node.new(value, node)
        return previous_node.next = new_node
      end
      previous_node = node
    end
  end

  def remove_at(index)
    previous_node = @head
    each_with_index do |node, idx|
      if index == idx
        old_node = node
        previous_node.next = old_node.next unless idx.zero?
        @head = @head.next if idx.zero?
        return old_node
      end
      previous_node = node
    end
  end

  def to_s
    string = ''
    each { |val| string << "( #{val} ) -> " }
    string << 'nil'
  end

  private

  attr_writer :head, :tail
end
