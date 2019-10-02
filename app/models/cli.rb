class Cli
    def greeting
        puts "Hi! Welcome to Auto-Park DC!"
    end

    def get_user
        puts "Please enter your name."
       user_input_name = gets.chomp
    end
    def get_username
        puts "Please create your username."
       user_input_username = gets.chomp
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
  end
  
  def get_parking_input
    gets.chomp.upcase
  end
#   def self.parking_selection(user_selection2)
#   location = nil

#   end 

    # self.show_parking(available_parking)
#  end

end

