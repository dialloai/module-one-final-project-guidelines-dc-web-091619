class Neighborhood < ActiveRecord::Base
  has_many :parkings

 def self.neighborhood_options
    puts "Please select the number of the location you'd like to park"
  self.all.each_with_index do |neighborhood,index|
    #  index + 1

      puts "#{index + 1}. #{neighborhood.location}"

    end
 end

 def self.neighborhood_selection(user_selection)
  location = nil
  if user_selection.to_i == 1

      location = Neighborhood.find_by(location: "North Dupont")
    elsif user_selection.to_i == 2
      location = Neighborhood.find_by(location: "South Dupont")
    elsif user_selection.to_i == 3
      location = Neighborhood.find_by(location: "G Street")
    else
      puts "Sorry, that selection isn't valid, please try again"
  end
  available_parking = location.parkings.select do |parking_space|
    parking_space.vacancy == true
  end
  puts "There are #{available_parking.length} space(s) available"
 end
end

#iterate thru location.parkings vacancy == true 
#