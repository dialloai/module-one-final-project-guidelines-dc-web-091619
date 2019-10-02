class Customer < ActiveRecord::Base
  has_many :reservations
  has_many :parkings, through: :reservations
end