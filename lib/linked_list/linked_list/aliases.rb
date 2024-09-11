# JM, 09/06/2024
#
# This module gives familiar aliases to LL methods that perform similiar functions to core Ruby data structure methods.
# Examples: << and push for append, length for size, include? for contains?.
module Aliases
  def <<(value)
    append(value)
  end

  def push(value)
    append(value)
  end

  def unshift(value)
    prepend(value)
  end

  def shift
    remove_at(0)
  end

  def [](index)
    at(index)
  end

  def length
    size
  end

  def include?(value)
    contains?(value)
  end

  def index_of(value)
    find(value)
  end

  def delete_at(index)
    remove_at(index)
  end
end
