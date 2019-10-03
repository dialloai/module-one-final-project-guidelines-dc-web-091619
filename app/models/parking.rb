class Parking < ActiveRecord::Base
  belongs_to :neighborhood
  has_many :reservations
  has_many :customers, through: :reservations


end