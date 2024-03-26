# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

require "open-uri"
require "faker"

transport_array = ["plane", "driving", "bicycling", "walking"]
consumption_array = ["5", "8", "0", "0"]

Trip.destroy_all
Transport.destroy_all
User.destroy_all
Compensation.destroy_all
TransportType.destroy_all

puts "let's create a user"

user1 = User.create!(email: "toto@gmail.com", password: "azertyuiop")

puts "let's create a trip"

Trip.create!(departure: "Marseille", destination: "Athenes", user_id: user1.id)

puts "let's create a transports types ..."

(0..3).each do |i|
  TransportType.create!(name: transport_array[i], fuel_consumption: consumption_array[i])
end

puts "let'screate a compensations ..."

(1..5).each do
  Compensation.create(name: Faker::Company.catch_phrase, co2_absorption: Faker::Number.number(digits: 2))
end

puts "ok that's all"
