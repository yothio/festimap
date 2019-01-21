# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.first

for num in 1..5 do

  Event.create(name: "event#{num}", user: user, map: "10,10\n0,2,3,4,5,6,7,8,9,10\n1,0,3,4,5,6,7,8,9,10\n1,0,3,4,5,6,7,8,9,10\n1,2,3,4,5,6,7,8,9,10\n1,2,3,4,5,6,7,8,9,10\n1,2,3,4,5,6,7,8,9,10\n1,2,3,4,5,6,7,8,9,10\n1,2,3,4,5,6,7,8,9,10\n1,2,3,4,5,6,7,8,9,10\n1,2,3,4,5,6,7,8,9,10\n")
end