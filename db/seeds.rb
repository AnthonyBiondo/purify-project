# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
require "faker"

TRANSPORTS = ["plane", "car", "bike", "train", "boat", "carpool", "bus"]

puts "let's hydrate the db with trips ..."
Trip.destroy_all
User.destroy_all
Compensation.destroy_all
Transport.destroy_all

user1 = User.create!(email: "toto@gmail.com", password: "azertyuiop")

# (1..20).each do
#   Trip.create!(departure: Faker::Address.city, destination: Faker::Address.city, user_id: user1.id)
# end

Trip.create!(departure: "Marseille", destination: "Athenes", user_id: user1.id)

puts "let's hydrate the db with transports ..."

# (1..20).each do |i|
#   Transport.create(
#     transport_type: TRANSPORTS.sample,
#     duration: Faker::Number.number(digits: 2),
#     distance: Faker::Number.number(digits: 5),
#     co2_capacity: Faker::Number.number(digits: 4),
#     trip_id: i
#   )
# end

puts "let's hydrate the db with compensations ..."

(1..5).each do
  Compensation.create(name: Faker::Company.catch_phrase, co2_absorption: Faker::Number.number(digits: 2))
end

puts "ok that's all"
