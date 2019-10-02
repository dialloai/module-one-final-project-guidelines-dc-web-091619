require_relative '../config/environment'

cli = Cli.new

cli.greeting

user_input_name = cli.get_user
user_input_username = cli.get_username

new_customer = Customer.create(name: user_input_name, username: user_input_username)

Neighborhood.neighborhood_options
user_selection = gets.chomp

Neighborhood.neighborhood_selection(user_selection)