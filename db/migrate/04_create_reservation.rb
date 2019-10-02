class CreateReservation < ActiveRecord::Migration[5.2]
    def change
      create_table :reservations do |table|
        table.integer :customer_id
        table.integer :parking_id          
      end
    end
  end