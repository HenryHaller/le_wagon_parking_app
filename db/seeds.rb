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
Car.delete_all
User.delete_all
Booking.delete_all


#creating sample user
User.create(first_name: "jon", last_name: "jones", email: "test@gmail.com", password: "123456")

20.times do
  User.create(first_name: Faker::Dog.name, last_name: Faker::Pokemon.name, email: Faker::Internet.email, password: "123456")
end

puts "Created #{User.count} Users"


User.all.each do |user|
  7.times do
    Spot.create(site_name: "fake site name", address: "fake address", hourly_rate: (5..30).to_a.sample, description: 'some spot', location: "75n, 78s", user: user)
  end
end

puts "created #{Spot.count} spots"

User.all.each do |user|
  3.times do
    Car.create(make: "fake make", model: "fake model", license_plate: "fake plate", color: 'a color', year: 1999, user: user)
  end
end

puts "created #{Car.count} cars"

Spot.all.each do |spot|
  3.times do
    Booking.create(spot: spot, car: spot.user.cars.first, duration: (1..8).to_a.sample)
  end
end

puts "created #{Booking.count} bookings"
