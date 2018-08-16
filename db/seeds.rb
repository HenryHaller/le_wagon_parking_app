# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Spot
#User
Booking.delete_all
Spot.delete_all
Car.delete_all
User.delete_all


#creating sample user
u1 = User.create(first_name: "jon", last_name: "jones", email: "test@gmail.com", password: "123456")
u2 = User.create(first_name: "sam", last_name: "smith", email: "test2@gmail.com", password: "123456")

Spot.create(site_name: "Home Sweet Williston", address: "348 southfield drive, Williston, vt", hourly_rate: 1, description:"good parking for 1 car", user: u1)
Spot.create(site_name: "Burlington Parking", address: "Burlington, VT", hourly_rate: 2, description:"park in btv", user: u1)

# 5.times do
#   User.create(first_name: Faker::Dog.name, last_name: Faker::Pokemon.name, email: Faker::Internet.email, password: "123456")
# end


