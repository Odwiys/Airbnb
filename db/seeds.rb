# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"

puts "Clearing old data..."
User.destroy_all
Listing.destroy_all
puts "Database clean!"

puts 'Creating Users...'
user_host = User.new(
  name: "Host name",
  email: "userhost@mail.com",
  password: "123123",
  phone_number: "999"
)
user_host.save!

user_guest = User.new(
  name: "Guest name",
  email: "userguest@mail.com",
  password: "321321",
  phone_number: "911"
)
user_guest.save!
puts 'Users Created!'

puts 'Creating 50 fake listings...'
50.times do
  listing = Listing.new(
    name: Faker::Name.name,
    location: "#{Faker::Address.city}, #{Faker::Address.country}",
    details: Faker::Lorem.paragraph,
    price: rand(0..1000),
    user: user_host
  )

  listing.save!

  file = URI.open("https://source.unsplash.com/featured/?house")
  listing.images.attach(io: file, filename: "img.png", content_type: "image/png")

  listing.save!
end

puts 'Finished!'

puts "Creating reservations"
10.times do
  puts "Creating a new reservation..."
  reservation = Reservation.new(
    start_date: Faker::Date.between(from: 1.day.from_now, to: 6.months.from_now),
    end_date: Faker::Date.between(from: Date.current, to: 7.months.from_now)
  )

  reservation.save!
  puts "Created reservation"
end
