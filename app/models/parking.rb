class Parking < ActiveRecord::Base
  belongs_to :neighborhood
  has_many :reservations
  has_many :customers, through: :reservations

def self.choose_parking(user_selection)
    
    parking_space = Parking.find_by(parking_space: user_selection)
    
  end
end