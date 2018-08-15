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
User.create(first_name: "jon", last_name: "jones", email: "test@gmail.com", password: "123456")
User.create(first_name: "sam", last_name: "smith", email: "test2@gmail.com", password: "123456")



# 5.times do
#   User.create(first_name: Faker::Dog.name, last_name: Faker::Pokemon.name, email: Faker::Internet.email, password: "123456")
# end

puts "Created #{User.count} Users"
u = User.all.last
Spot.create(site_name: "spot1", address: "123 fake st", hourly_rate: (5..30).to_a.sample, description: 'a first spot', location: "75n, 78s", user: u )
Spot.create(site_name: "spot2", address: "456 lake st", hourly_rate: (5..30).to_a.sample, description: 'a second spot', location: "75n, 78s", user: u )


# User.all.each do |user|
#   2.times do
#     Spot.create(site_name: "fake site name", address: "fake address", hourly_rate: (5..30).to_a.sample, description: 'some spot', location: "75n, 78s", user: user)
#   end
# end

puts "created #{Spot.count} spots"


User.all.each do |user|
  maker = ["https://www.popsci.com/sites/popsci.com/files/styles/1000_1x_/public/images/2018/03/senna.jpg?itok=eYNPMGjA&fc=50,50", "https://amp.businessinsider.com/images/5aabc7bbc72ac12f008b4609-750-563.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM3XKvQ4tbYVq4rEIvphrSncrNkf_J0_-ugWNgADpqYEtVNiywqg", "https://www.fitmycar.com/journal/wp-content/uploads/2015/12/Top-Ten-Import-Tuner-Cars.jpg", "https://images.pexels.com/photos/707046/pexels-photo-707046.jpeg?cs=srgb&dl=light-road-landscape-707046.jpg&fm=jpg"].sample
  1.times do
    maker_car = Car.new(make: "fake make", model: "fake model", license_plate: "fake plate", color: 'a color', year: 1999, user: user)
    maker_car.remote_photo_url = maker
    maker_car.save
  end
end

puts "created #{Car.count} cars"

Spot.all.each do |spot|
  1.times do
    Booking.create(spot: spot, car: spot.user.cars.first, duration: (1..8).to_a.sample)
  end
end

puts "created #{Booking.count} bookings"
