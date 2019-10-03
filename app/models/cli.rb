require_relative '../../config/environment'
# require 'tty-prompt'


class Cli
  attr_accessor :parking_space
  attr_reader :new_customer
    def greeting
        puts "Hi! Welcome to Auto-Park DC!"
        self.get_user
    end

    def get_user
        puts "Please enter your name."
       user = gets.chomp
        puts "Please create your username."
       username = gets.chomp
      @new_customer = Customer.create(name: user, username: username)

    end
    
    def neighborhood_options
    puts "Please select the number of the location you'd like to park"
        Neighborhood.all.each_with_index do |neighborhood,index|
        puts "#{index + 1}. #{neighborhood.location}"
      end
      user_selection = gets.chomp
      available_parking = self.neighborhood_selection(user_selection)
    end

    def neighborhood_selection(user_selection)
      location = nil
        if user_selection.to_i == 1
          location = Neighborhood.find_by(location: "North Dupont")
        elsif user_selection.to_i == 2
          location = Neighborhood.find_by(location: "South Dupont")
        elsif user_selection.to_i == 3
          location = Neighborhood.find_by(location: "G Street")
        else
        puts "Sorry, that selection isn't valid, please try again" 
        self.neighborhood_options
          user_selection = gets.chomp
        self.neighborhood_selection(user_selection)
        return 
        end
      available_parking = location.parkings.select do |parking_space|
      parking_space.vacancy == true
      end  
    self.show_parking(available_parking)
  end


#DISPLAY MENU OF USER OPTIONS
    #NEIGHBORHOOD OPTIONS
    #DISPLAY HOW  MANY PARKING SPACES AVAILABLE
    #ASK DO YOU WANT TO RESERVE A SPOT
    # def display_location_options
    #     puts 
    # end

  def show_parking(available_parking)
      puts "There are #{available_parking.length} space(s) available"
      available_parking.each_with_index do |parking,index|
    #  index + 1
      puts "#{index + 1}. #{parking.parking_space}"

    end
    puts "Please enter the parking space code."
    user_selection = self.get_parking_input(available_parking)
    self.choose_parking(user_selection)
  end

  def get_parking_input(available_parking)
    input = gets.chomp.upcase 
    parking_input = available_parking.find do |parking|
    parking.parking_space == input
    end
    if parking_input.nil?
      show_parking(available_parking)
    else
      return parking_input
    end
  end

  def choose_parking(user_selection)
     @parking_space = user_selection
    reservation_input = self.reservation_prompt
    self.confirm_reservation(reservation_input)

  end
  
  

  def reservation_prompt
    puts "Would you like to reserve this space?\n Select YES / NO"
    gets.chomp.upcase
  end
  
  
  def confirm_reservation(reservation_input)
    if reservation_input == "YES"
      puts "Confirmed! \nYou have booked #{@parking_space.parking_space} in #{@parking_space.neighborhood.location}"
      new_reservation = Reservation.create(customer_id: @new_customer.id, parking_id: @parking_space.id)

    elsif reservation_input == "NO"
      #go back to main menu
      self.neighborhood_options

      # show_parking(available_parking)
      # user_selection = get_parking_input
      # reservation_prompt(user_selection)

    else 
      puts "This selection is not valid, please try again."
      user_selection = reservation_prompt
      confirm_reservation(user_selection)
    end
  end

  

end
#   def self.parking_selection(user_selection2)
#   location = nil

#   end 

    # self.show_parking(available_parking)
#  end



