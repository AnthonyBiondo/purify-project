# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

transport_array = ["plane", "driving", "bicycling", "walking"]
consumption_array = ["100", "250", "0", "0"]

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

Compensation.create(name: "Participation in reforestation", co2_absorption: "10")
Compensation.create(name: "Participation in the protection of existing forests", co2_absorption: "15")
Compensation.create(name: "Participation in agriculture and land management", co2_absorption: "5")
Compensation.create(name: "Implementing energy renovation", co2_absorption: "20")
Compensation.create(name: "Participation in carbon capture", co2_absorption: "12")
Compensation.create(name: "Committing to prioritize public transportation", co2_absorption: "8")
Compensation.create(name: "Ceasing meat consumption", co2_absorption: "30")

puts "ok that's all"
