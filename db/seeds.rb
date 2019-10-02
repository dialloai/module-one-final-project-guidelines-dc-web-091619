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


#neighborhoods
north_dupont = Neighborhood.find_or_create_by(location: "North Dupont")

# #parkings
space_1a = Parking.find_or_create_by(parking_space: "1A", vacancy: true, cost: 20, neighborhood_id: north_dupont.id)

# #reservations
tom_1a = Reservation.find_or_create_by(customer_id: tom.id, parking_id: space_1a.id)

# require 'faker'

# 10.times do
#     Customer.create([{
#         name: Faker::Name.name,
#         username: Faker::String.random(length: 5)
#     }])
#     end