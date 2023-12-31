# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"

PLACE_NAMES = [
  "Whispering Pines Retreat",
  "Seaside Serenity Villa",
  "The Enchanted Cottage",
  "Urban Chic Loft",
  "Mountain Haven Hideaway",
  "Tranquil Riverfront Lodge",
  "Dreamy Beachside Bungalow",
  "Luxe Skyline Penthouse",
  "Cozy Cabin in the Woods",
  "Island Paradise Getaway",
  "Historic Victorian Manor",
  "Zen Garden Oasis",
  "Secluded Lakeside Chalet",
  "Tropical Paradise Villa",
  "Artsy Bohemian Studio",
  "Retro Vintage Camper Experience",
  "Rustic Farm Retreat",
  "Modern City Escape",
  "Treehouse Wonderland",
  "Coastal Castle Retreat",
]

puts "Clearing old data..."

Reservation.destroy_all
Wishlist.destroy_all
Listing.destroy_all
User.destroy_all

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

puts 'Creating 20 fake listings...'
PLACE_NAMES.length.times do |index|
  puts "creating new listing..."
  listing = Listing.new(
    name: PLACE_NAMES[index],
    location: Faker::Address.city(options: { with_state: true }),
    details: Faker::Lorem.paragraph,
    price: rand(0..1000),
    user: user_host
  )

  listing.save!
  puts "created #{listing.name}!"
  puts  "attaching images..."

  file = URI.open("https://source.unsplash.com/featured/?house")
  listing.images.attach(io: file, filename: "img.png", content_type: "image/png")

  listing.save!
  puts "Image added!"
end

puts 'Finished!'

puts "Creating wishlist..."
wishlist_new_one = Wishlist.new(
  name: "Wishlist name",
  user: user_guest
)
wishlist_new_one.save!

wishlist_new_two = Wishlist.new(
  name: "Wishlist name",
  user: user_guest
)
wishlist_new_two.save!

wishlist_new_three = Wishlist.new(
  name: "Wishlist name",
  user: user_guest
)
wishlist_new_three.save!
puts 'Wishlist Created!'

puts "Creating a new reservation..."
reservation = Reservation.new(
  start_date: Faker::Date.between(from: 1.day.from_now, to: 6.months.from_now),
  end_date: Faker::Date.between(from: Date.current, to: 12.months.from_now),
  user: user_guest,
  listing: Listing.first
)
reservation.save!

reservation_two = Reservation.new(
  start_date: Faker::Date.between(from: 1.day.from_now, to: 6.months.from_now),
  end_date: Faker::Date.between(from: Date.current, to: 12.months.from_now),
  user: user_guest,
  listing: Listing.all[1]
)
reservation_two.save!

reservation_three = Reservation.new(
  start_date: Faker::Date.between(from: 1.day.from_now, to: 6.months.from_now),
  end_date: Faker::Date.between(from: Date.current, to: 12.months.from_now),
  user: user_guest,
  listing: Listing.all[2]
)
reservation_three.save!

puts "Created reservation"
