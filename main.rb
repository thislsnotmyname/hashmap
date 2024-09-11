require_relative 'lib/hashmap'
require 'awesome_print'

hash = HashMap.new

puts "Can get the value of a key that doesn't exist ('good'): #{hash.get('good').inspect}"

hash.set('snake', 'snakes')
hash.set('sheep', 'sheep')

puts ''

puts "Set 'cactus' value to 'cactuses': #{hash.set('cactus', 'cactuses')}"
puts "Can get the value of a key that does exist ('cactus'): #{hash.get('cactus').inspect}"

puts ''

puts "Set 'cactus' value to 'cacti': #{hash.set('cactus', 'cacti')}"
puts "Can change the value of a key ('cactus'): #{hash.get('cactus').inspect}"

hash.set('ice cream', 'ice creams')
hash.set('fence', 'fences')

puts ''

puts "Returns true if the HashMap has the key 'ice cream': #{hash.has?('ice cream')}"
puts "Returns false since the HashMap doesn't have the key 'ice creamy goodness': #{hash.has?('ice creamy goodness')}"

ap hash.buckets
