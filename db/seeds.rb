#USER #find_or_create_by(:name)
require_relative "../app/models/customer.rb"
require_relative "../app/models/neighborhood.rb"
require_relative "../app/models/parking.rb"
require_relative "../app/models/reservation.rb"

Customer.destroy_all
Neighborhood.destroy_all
Reservation.destroy_all
Parking.destroy_all

#customers
tom = Customer.find_or_create_by(name: "Tom Adams", username: "TomAdams110024")



####neighborhoods
north_dupont = Neighborhood.find_or_create_by(location: "North Dupont")
south_dupont = Neighborhood.find_or_create_by(location: "South Dupont")
g_street = Neighborhood.find_or_create_by(location: "G Street")

####parkings
#north_dupont parkings
space_1a = Parking.find_or_create_by(parking_space: "1A", vacancy: true, cost: 20, neighborhood_id: north_dupont.id)
space_2a = Parking.find_or_create_by(parking_space: "2A", vacancy: false, cost: 20, neighborhood_id: north_dupont.id)
space_3a = Parking.find_or_create_by(parking_space: "3A", vacancy: true, cost: 20, neighborhood_id: north_dupont.id)

#south_dupont parkings
space_1b = Parking.find_or_create_by(parking_space: "1B", vacancy: true, cost: 22, neighborhood_id: south_dupont.id)
space_2b = Parking.find_or_create_by(parking_space: "2B", vacancy: true, cost: 22, neighborhood_id: south_dupont.id)
space_3b = Parking.find_or_create_by(parking_space: "3B", vacancy: true, cost: 22, neighborhood_id: south_dupont.id)

#g_sreet parkings
space_1c = Parking.find_or_create_by(parking_space: "1C", vacancy: true, cost: 17, neighborhood_id: g_street.id)
space_2c = Parking.find_or_create_by(parking_space: "2C", vacancy: true, cost: 17, neighborhood_id: g_street.id)
space_3c = Parking.find_or_create_by(parking_space: "3C", vacancy: true, cost: 17, neighborhood_id: g_street.id)


#####reservations
tom_1a = Reservation.find_or_create_by(customer_id: tom.id, parking_id: space_2a.id)

# require 'faker'

# 10.times do
#     Customer.create([{
#         name: Faker::Name.name,
#         username: Faker::String.random(length: 5)
#     }])
#     end