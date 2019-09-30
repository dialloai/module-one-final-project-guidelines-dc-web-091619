class CreateReservation < ActiveRecord::Migration[5.2]
    def change
      create_table :reservations do |table|
        table.boolean :confirmation          
      end
    end
  end