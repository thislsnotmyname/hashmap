require_relative 'linked_list/linked_list'
require_relative 'hashmap/hashnode'
require 'prime'

# JM, 09/11/2024
#
# This class handles the implementation of the HashMap data structure.
class HashMap
  LOAD_FACTOR = 0.75

  attr_reader :capacity

  def initialize
    @capacity = 16
    @buckets = Array.new(@capacity) { nil }
    @prime_number = 31
  end

  def set(key, value)
    grow_if_needed
    index = create_index(key)

    @buckets[index] = LinkedList.new unless @buckets[index]
    key_value_node = HashNode.new(hash(key), key, value)
    key_index_in_bucket = @buckets[index].find(key_value_node) # returns nil if node doesn't exist

    # if the key exists already
    return @buckets[index][key_index_in_bucket].value = value if key_index_in_bucket

    # if it doesn't
    @buckets[index].append(key_value_node).value.value
  end

  def get(key)
    index = create_index(key)

    bucket = @buckets[index]
    index_of_key = bucket&.find(HashNode.new(hash(key), key, ''))
    return nil if bucket.nil? || index_of_key.nil?

    bucket[index_of_key].value
  end

  def has?(key)
    @buckets.each do |bucket|
      true_yet = bucket&.contains?(HashNode.new(hash(key), key, '')) || false
      return true if true_yet
    end
    false
  end

  def remove(key)
    return has?(key) unless has?(key)

    index = create_index(key)

    bucket = @buckets[index]
    index_of_key = bucket&.find(HashNode.new(hash(key), key, ''))

    old_value = bucket[index_of_key].value
    bucket.remove_at(index_of_key)

    old_value
  end

  def length
    @buckets.reduce(0) do |size, bucket|
      size += bucket&.length if bucket
      size
    end
  end

  def clear
    @buckets.map! { nil }
  end

  def keys
    @buckets.each_with_object([]) do |bucket, arr_of_keys|
      bucket&.each { |node| arr_of_keys.push(node.value.key) }
    end
  end

  def values
    @buckets.each_with_object([]) do |bucket, arr_of_values|
      bucket&.each { |node| arr_of_values.push(node.value.value) }
    end
  end

  def entries
    @buckets.each_with_object([]) do |bucket, arr_of_entries|
      bucket&.each { |node| arr_of_entries.push([node.value.key, node.value.value]) }
    end
  end

  alias []= set
  alias [] get
  alias key? has?
  alias size length

  private

  def hash(key)
    hash_code = 0

    key.each_char { |char| hash_code = @prime_number * hash_code + char.ord }

    hash_code
  end

  def need_to_grow?
    (@capacity * LOAD_FACTOR) <= keys.length
  end

  def grow_if_needed
    return unless need_to_grow?

    all_entries = entries
    @prime_number = new_prime_number
    clear

    @buckets.concat(Array.new(@capacity) { nil })
    @capacity *= 2

    all_entries.each { |entry| set(entry[0], entry[1]) }
  end

  def create_index(key)
    raise TypeError unless key.instance_of? String

    index = hash(key) % @capacity
    raise IndexError if index.negative? || index >= @buckets.length

    index
  end

  def new_prime_number
    previous_prime = 1
    Prime.each(@capacity * 5) do |prime|
      return previous_prime if (@capacity * 4).between?(previous_prime, prime)

      previous_prime = prime
    end
  end

  attr_accessor :buckets
  attr_writer :capacity
end
