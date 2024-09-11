require_relative 'linked_list/linked_list'
require_relative 'hashmap/hashnode'
# JM, 09/09/2024
#
#   raise IndexError if index.negative? || index >= @buckets.length
#
# This class handles the implementation of the HashMap data structure.
class HashMap
  LOAD_FACTOR = 0.75

  attr_reader :capacity, :buckets

  def initialize
    @capacity = 16
    @buckets = Array.new(@capacity) { nil }
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  # def grow?
  #   (@capacity * LOAD_FACTOR) < @buckets.reject(&:nil)
  # end

  # def grow
  #   return unless grow?

  #   @capacity *= 2
  # end

  def set(key, value)
    index = create_index(key)

    @buckets[index] = LinkedList.new if @buckets[index].nil?
    key_value_node = HashNode.new(hash(key), key, value)
    key_index_in_bucket = @buckets[index].find(key_value_node) # returns nil if node doesn't exist

    # if the key exists already
    if key_index_in_bucket
      @buckets[index][key_index_in_bucket].value = value
    # if it doesn't
    else
      @buckets[index].append(key_value_node)
    end
  end

  private

  def create_index(key)
    index = hash(key) % @capacity
    raise IndexError if index.negative? || index >= @buckets.length
  end

  attr_writer :capacity, :buckets
end
