# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
puts "Destory the database..."
Game.destroy_all
pages = (1..3).to_a
pages.each do |num|
  url = "https://api.rawg.io/api/games?page=#{num}&key=b7a4871ebfad430ca835d6587cc0c026"

  response = JSON.parse(URI.open(url).read)
  response["results"].each do |game|
    Game.create!(
      name: game["name"],
      background_image: game["background_image"]
    )
  end
end
puts "#{Game.count} games are created"
