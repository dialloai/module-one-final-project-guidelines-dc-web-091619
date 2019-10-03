require_relative '../../config/environment'

class Neighborhood < ActiveRecord::Base
  has_many :parkings


 
#  def self.show_parking(available_parking)
#   available_parking.
#  end

end


#iterate thru location.parkings vacancy == true 
#