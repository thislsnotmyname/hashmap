require_relative 'lib/hashmap'
require 'awesome_print'

hash = HashMap.new

hash.set('key', 'value')
hash.set('keys', 'value')
hash.set('keys', 'value')

ap hash.buckets
