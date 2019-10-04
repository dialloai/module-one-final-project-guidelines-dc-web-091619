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
space_4a=  Parking.find_or_create_by(parking_space: "4A", vacancy: true, cost: 20, neighborhood_id: north_dupont.id)
space_5a=  Parking.find_or_create_by(parking_space: "5A", vacancy: true, cost: 20, neighborhood_id: north_dupont.id)
space_6a = Parking.find_or_create_by(parking_space: "6A", vacancy: true, cost: 20, neighborhood_id: north_dupont.id)
space_7a = Parking.find_or_create_by(parking_space: "7A", vacancy: true, cost: 20, neighborhood_id: north_dupont.id)
space_8a = Parking.find_or_create_by(parking_space: "8A", vacancy: true, cost: 20, neighborhood_id: north_dupont.id)
space_9a=  Parking.find_or_create_by(parking_space: "9A", vacancy: true, cost: 20, neighborhood_id: north_dupont.id)
space_10a= Parking.find_or_create_by(parking_space: "10A", vacancy: true, cost: 20, neighborhood_id: north_dupont.id)

#south_dupont parkings
space_1b = Parking.find_or_create_by(parking_space: "1B", vacancy: true, cost: 22, neighborhood_id: south_dupont.id)
space_2b = Parking.find_or_create_by(parking_space: "2B", vacancy: true, cost: 22, neighborhood_id: south_dupont.id)
space_3b = Parking.find_or_create_by(parking_space: "3B", vacancy: true, cost: 22, neighborhood_id: south_dupont.id)
space_4b = Parking.find_or_create_by(parking_space: "4B", vacancy: false, cost: 22, neighborhood_id: south_dupont.id)
space_5b = Parking.find_or_create_by(parking_space: "5B", vacancy: true, cost:22, neighborhood_id: south_dupont.id)
space_6b = Parking.find_or_create_by(parking_space: "6B", vacancy: true, cost: 22, neighborhood_id: south_dupont.id)
space_7b = Parking.find_or_create_by(parking_space: "7B", vacancy: true, cost: 22, neighborhood_id: south_dupont.id)
space_8b = Parking.find_or_create_by(parking_space: "8B", vacancy: true, cost: 22, neighborhood_id: south_dupont.id)
space_9b = Parking.find_or_create_by(parking_space: "9B", vacancy: false, cost: 22, neighborhood_id: south_dupont.id)
space_10b = Parking.find_or_create_by(parking_space: "10B", vacancy: true, cost:22, neighborhood_id: south_dupont.id)


#g_sreet parkings
space_1c = Parking.find_or_create_by(parking_space: "1C", vacancy: true, cost: 17, neighborhood_id: g_street.id)
space_2c = Parking.find_or_create_by(parking_space: "2C", vacancy: false, cost: 17, neighborhood_id: g_street.id)
space_3c = Parking.find_or_create_by(parking_space: "3C", vacancy: false, cost: 17, neighborhood_id: g_street.id)
space_4c = Parking.find_or_create_by(parking_space: "4C", vacancy: false, cost: 17, neighborhood_id: g_street.id)
space_5c = Parking.find_or_create_by(parking_space: "5C", vacancy: false, cost: 17, neighborhood_id: g_street.id)
space_6c = Parking.find_or_create_by(parking_space: "6C", vacancy: false, cost: 17, neighborhood_id: g_street.id)
space_7c = Parking.find_or_create_by(parking_space: "7C", vacancy: false, cost: 17, neighborhood_id: g_street.id)
space_8c = Parking.find_or_create_by(parking_space: "8C", vacancy: false, cost: 17, neighborhood_id: g_street.id)
space_9c = Parking.find_or_create_by(parking_space: "9C", vacancy: false, cost: 17, neighborhood_id: g_street.id)
space_10c = Parking.find_or_create_by(parking_space: "10C", vacancy: false, cost: 17, neighborhood_id: g_street.id)

#####reservations
tom_1a = Reservation.find_or_create_by(customer_id: tom.id, parking_id: space_2a.id)

# require 'faker'

# 10.times do
#     Customer.create([{
#         name: Faker::Name.name,
#         username: Faker::String.random(length: 5)
#     }])
#     end