class CreateParking < ActiveRecord::Migration[5.2]
    def change
      create_table :parkings do |table|
        table.string :parking_space
        table.boolean :vacancy  
        table.integer :cost
        table.integer :neighborhood_id
      end
    end
  end