# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

listing = Listing.create(name: "Milan", location: "Paris", details: "Indulge in the ultimate Parisian experience at our luxurious apartment. With breathtaking views and stunning architectural details, every element of this space is designed for an unforgettable adventure. Relax in the living room and enjoy a majestic panorama of the Eiffel Tower and the Seine River.The Louis XIV bedroom is a tranquil oasis in the heart of Paris, providing a moment of serenity. There is no kitchen in the apartment.", price: 524, image_url: "https://a0.muscache.com/im/pictures/miso/Hosting-631154213461762756/original/61565b09-fc0b-43a7-a489-4a8ec30219ce.jpeg")

listing = Listing.create(name: "Diana", location: "Las Vegas", details: "This private luxury residential tower studio condo is connected to the world's largest Resort-Casino complex by 5-minute stroll in climate-controlled indoor moving walkways. They take you to the heart of the Resort-Casino, Grand Garden Arena and restaurant district without ever going outdoors. Tube down their signature lazy river, enjoy the 4 pool complex + 3 other pools behind your building. The complex has 7,043 rooms and 38 eating/drinking venues. That's a dream resort", price: 246, image_url: "https://a0.muscache.com/im/pictures/miso/Hosting-792498226507571643/original/9ffab26b-d328-4704-900b-58d32ef92a4d.jpeg")

listing = Listing.create(name: "Aki", location: "Fujikawaguchiko", details: "Escape to the tranquility of an old shrine nestled amidst the breathtaking beauty of Mt. Fuji. Immerse yourself in nature's embrace as you savor the awe-inspiring view of Japan's iconic mountain from the comfort of your Airbnb accommodation. This unique lodging offers a truly exceptional experience, allowing you to bask in the serenity of your surroundings. Located within walking distance of the lake, you'll have the opportunity to explore its pristine shores at your leisure. Spend your days strolling along the tranquil waters, taking in the panoramic vistas, or even indulging in water activities if you so desire. Whether you seek solitude or adventure, this location caters to both.", price: 134, image_url: "https://a0.muscache.com/im/pictures/74f4c7d4-25e6-4c0c-963b-cba41cc2c152.jpg?im_w=1200")

puts 'Creating 50 fake listings...'
50.times do
  listing = Listing.new(
    name: Faker::Name.name,
    location: "#{Faker::Address.city}, #{Faker::Address.country}",
    details: Faker::Lorem.paragraph,
    price: rand(0..1000),
    image_url: "https://source.unsplash.com/1200x800/?#{city}"
  )

  listing.save
end

puts 'Finished!'
