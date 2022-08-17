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



user_names = ['Oanh', 'Song', 'Tony', 'Yaya']
user_names.each do |user_name|
  User.create!(
    name: user_name,
    email: "playwon#{user_name}@gmail.com",
    password: "123123"
  )
end
puts "#{User.count} users are created:)"



titles = ["Good Coach", "Do you want to be perfect at Xgame", "Perfect Coach"]

titles.each_with_index do |title, index|
  Offer.create!(
    title: title,
    duration: rand(0.5...5.0).round(1),
    price: rand(1000...100000),
    game: Game.all[index],
    user: User.all[index]
  )
end
puts "#{Offer.count} offers are created:)"




Booking.create!(
  date: Time.now - 1.day,
  status: 0,
  offer: Offer.all[0],
  user: User.all[3]
)
Booking.create!(
  date: Time.now - 3.day,
  status: 1,
  offer: Offer.all[1],
  user: User.all[0]
)
Booking.create!(
  date: Time.now - 5.day,
  status: 2,
  offer: Offer.all[2],
  user: User.all[3]
)

puts "#{Booking.count} bookings are created:)"
