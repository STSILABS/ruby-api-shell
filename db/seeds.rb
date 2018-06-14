# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Room.create title:'Oakmont Room', building:'HQ', capacity:10
Room.create title:'Belhaven Room', building:'HQ', capacity:15
Room.create title:'Training Room', building:'Springfield Division', capacity:30
Room.create title:'North', building:'Springfield Division', capacity:6
