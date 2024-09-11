# JM, 09/09/2024
#
# This class creates the Nodes of a HashMap.
class HashNode
  attr_accessor :value
  attr_reader :hash_value, :key

  def initialize(hash, key, value)
    @hash_value = hash
    @key = key
    @value = value
  end

  def ==(other)
    p [@hash_value, other.hash_value]
    @hash_value == other.hash_value &&
      @key == other.key
  end

  def to_s
    [@hash, @key, @value]
  end

  private

  attr_writer :hash_value, :key
end
