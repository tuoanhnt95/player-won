# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "faker"

puts "Destory the booking database..."
Booking.destroy_all

puts "Destory the offer database..."
Offer.destroy_all

puts "Destory the user database..."
User.destroy_all

puts "Destory the game database..."
Game.destroy_all

# 39073 pages of games are there
# pages = (1..3).to_a
  url = "https://api.rawg.io/api/games?page=1&key=b7a4871ebfad430ca835d6587cc0c026"

  response = JSON.parse(URI.open(url).read)
  response["results"].each_with_index do |game, index|
    if index < 10
      Game.create!(
        name: game["name"],
        background_image: game["background_image"]
      )
    end
  end
puts "#{Game.count} games are created:)"



user_names = ['Nikki', 'Joshua', 'Yu', 'Bill', 'Daniel', 'Yaya', 'Mounir', 'Soufiane', 'Adam', 'Ayaka', 'Alison', 'Kyle', 'Alex', 'Tony', 'Sae', 'Oanh', 'Andre', 'Mark', 'Leo', 'Jan', 'Koki', 'Malene', 'Carla', 'Song', 'Doug', 'Celso', 'Trouni', 'Ayanori', 'Noemi', 'Sylvain', 'Sasha', 'Yann']
user_names.each do |user_name|
  puts "Creating #{user_name}"
  user = User.create!(
    name: user_name,
    email: "playwon#{user_name}@gmail.com",
    password: "123123",
  )
  file = URI.open('https://source.unsplash.com/featured?profile')
  user.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
end
puts "#{User.count} users are created:)"

# titles = ["Good Coach", "Do you want to be perfect at Xgame", "Perfect Coach"]

100.times do
  Offer.create!(
    # title: titles.sample,
    duration: (rand(0.5...5.0) * 2.0).round / 2.0,
    price: rand(1000...100000).round(-2),
    game: Game.all.sample,
    user: User.all.sample
  )
end
puts "#{Offer.count} offers are created:)"

60.times do
  Booking.create!(
    date: Time.now + rand(0..90).day,
    # status: 0,
    offer: Offer.all.sample,
    user: User.all.sample,
    status: ['pending', 'accepted', 'rejected'].sample
  )
end


puts "#{Booking.count} bookings are created:)"
