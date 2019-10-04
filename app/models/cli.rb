require_relative '../../config/environment'

# require 'tty-prompt'


class Cli
  attr_accessor :parking_space
  attr_reader :new_customer
    def greeting
      puts  Rainbow("  ______
 /|_||_\\`.__
(   _    _ _\\
=`-(_)--(_)-'\n ").cyan
      puts Rainbow("Hi! Welcome to Auto-Park DC!\n* * * * * * * * * * * * *\n\n").aqua.bright.underline

          self.get_user
    end
    def get_user
        puts Rainbow("Please enter your name.\n").blue.bright
       user = gets.chomp
        puts Rainbow("Please create your username.\n").blue.bright
       username = gets.chomp
       
      @new_customer = Customer.create(name: user, username: username)
     

    end
    
    def neighborhood_options
       puts Rainbow("Welcome, #{@new_customer.name}!\n").blue.bright
    puts Rainbow("Please select the number of the location you'd like to park\n").blue.bright
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
        puts Rainbow("Sorry, that selection isn't valid, please try again").red.bright
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
      puts Rainbow("There are #{available_parking.length} space(s) available").blue.bright
      available_parking.each_with_index do |parking,index|
    #  index + 1
      puts "#{index + 1}. #{parking.parking_space}"
    end
    if available_parking.length > 0 
        puts Rainbow("Please enter the parking space code.").blue.bright
        user_selection = self.get_parking_input(available_parking)
        self.choose_parking(user_selection)
       else 
        puts Rainbow("Sorry! This parking lot is full, please select another location\n\n").red.bright
        self.neighborhood_options
    end
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
    puts Rainbow("Would you like to reserve this space for $#{@parking_space.cost}?\nSelect YES / NO").blue.bright
    gets.chomp.upcase
  end
  def exit_prompt
    puts Rainbow("Thank you for using the Auto-Park DC app!\n\n").yellow.bright
    puts Rainbow("    ____
 __/  |_\\_
|  _     _``-.
'-(_)---(_)--'   ").yellow.bright

    return exit
  end
  
  def confirm_reservation(reservation_input)
    if reservation_input == "YES"
      puts Rainbow("Confirmed! \nThank you, #{@new_customer.name}. You have reserved #{@parking_space.parking_space} in #{@parking_space.neighborhood.location}.\n").green.bright.underline
      new_reservation = Reservation.create(customer_id: @new_customer.id, parking_id: @parking_space.id)
      
      @parking_space.update(vacancy: false)
       self.exit_prompt
    elsif reservation_input == "NO"
      #go back to main menu
      self.neighborhood_options

      # show_parking(available_parking)
      # user_selection = get_parking_input
      # reservation_prompt(user_selection)

    else 
      puts Rainbow("This selection is not valid, please try again.\n").red.bright
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



