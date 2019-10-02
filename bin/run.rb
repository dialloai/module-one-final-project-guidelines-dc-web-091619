require_relative '../config/environment'

cli = Cli.new

cli.greeting

user_input_name = cli.get_user
user_input_username = cli.get_username

new_customer = Customer.create(name: user_input_name, username: user_input_username)

Neighborhood.neighborhood_options
user_selection = gets.chomp



available_parking = Neighborhood.neighborhood_selection(user_selection)

cli.show_parking(available_parking)
# user_selection2 = gets.chomp
# cli.parking_selection(user_selection2)

user_selection = cli.get_parking_input
Parking.choose_parking(user_selection)
# new_reservation = Reservation.create