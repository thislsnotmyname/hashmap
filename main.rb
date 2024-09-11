require_relative 'lib/hashmap'

hashmap = HashMap.new

print 'Entries: '
p hashmap.entries

puts "Can get the value of a key that doesn't exist ('good'): #{hashmap.get('good').inspect}"

puts 'Adding a couple entries...'
hashmap['snake'] = 'snakes'
hashmap.set('sheep', 'sheep')

puts ''

puts "Set 'cactus' key's value to 'cactuses': #{hashmap.set('cactus', 'cactuses')}"
puts "Can get the value of a key that does exist ('cactus'): #{hashmap['cactus'].inspect}"

puts ''

puts "Set 'cactus' key's value to 'cacti': #{hashmap['cactus'] = 'cacti'}"
puts "Can change the value of a key ('cactus'): #{hashmap['cactus'].inspect}"

puts ''

puts 'Adding a couple more entries...'
hashmap.set('ice cream', 'ice creams')
hashmap.set('fence', 'fences')

puts ''

puts "Returns true if the HashMap has the key 'ice cream': #{hashmap.has?('ice cream')}"
puts "Returns false since the HashMap doesn't have the key 'ice creamy goodness': "\
     "#{hashmap.key?('ice creamy goodness')}"

puts ''

puts "Number of keys in HashMap: #{hashmap.length}"

puts ''

puts "Remove key 'sheep': #{hashmap.remove('sheep')}"

print 'Array of keys: '
p hashmap.keys

puts ''

print 'Array of values: '
p hashmap.values

puts ''

print 'Array of entries: '
p hashmap.entries

puts ''

puts 'Clear!'
hashmap.clear

puts 'Adding a bunch of entries...'

hashmap['apple'] = 'red'
hashmap['banana'] = 'yellow'
hashmap['carrot'] = 'orange'
hashmap['dog'] = 'brown'
hashmap['elephant'] = 'gray'
hashmap['frog'] = 'green'
hashmap['grape'] = 'purple'
hashmap['hat'] = 'black'
hashmap['ice cream'] = 'white'
hashmap['jacket'] = 'blue'
hashmap['kite'] = 'pink'
hashmap['lion'] = 'golden'

puts ''

pp hashmap.entries

puts ''

puts "Number of entries: #{hashmap.size} | Capacity: #{hashmap.capacity}"
puts 'Adding just one more...'
hashmap['moon'] = 'silver'

puts "Number of entries: #{hashmap.size} | Capacity: #{hashmap.capacity}"
