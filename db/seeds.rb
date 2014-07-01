# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

name = "Siebel Basement"
clue = "While most students can be found in the lab doing work, you will need to travel even deeper into the heart of the building to find this clue"
location = "Siebel Center"
specific_location = "Bottom of stairwell on SW side of building leading to sub-basement"
alum = "Marc Andreessen / Mosaic Web Browser"
c = Code.find_or_create_by(name: name, clue: clue, location: location, specific_location: specific_location, alum: alum)
if c.errors.any?
  puts c.errors.messages
end

name = "Altgeld Bell Tower"
clue = "You might need to give up your lunch in order to hear...err find this clue"
location = "Altgeld"
specific_location = "Bell Tower"
alum = "Warren Arthur Ambrose / Father of modern geometry"
c = Code.find_or_create_by(name: name, clue: clue, location: location, specific_location: specific_location, alum: alum)
if c.errors.any?
  puts c.errors.messages
end

puts "There are now #{Code.count} codes in the database."
