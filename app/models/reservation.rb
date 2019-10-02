class Reservation < ActiveRecord::Base
  belongs_to :parking
  belongs_to :customer
end