# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Spot
#User

Spot.delete_all
User.delete_all


#creating sample user
User.create(first_name: "jon", last_name: "jones", email: "test@gmail.com", password: "123456")

20.times do
  User.create(first_name: Faker::Dog.name, last_name: Faker::Pokemon.name, email: Faker::Internet.email, password: "123456")
end

puts "Created #{User.count} Users"

Spot.create(name: "Mom's garage", address: "123 Main Street", price: 12, description: "Nice parking for a large car downtown")

20.times do
  Spot.create(site_name: Faker::SouthPark.character, address: Faker::TwinPeaks.location, price: (5..30).to_a.sample, description: 'some spot')
end

puts "created #{Spot.count} spots"
