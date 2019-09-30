class CreateParking < ActiveRecord::Migration[5.2]
    def change
      create_table :parkings do |table|
        table.string :address
        table.boolean :vacancy  
        table.integer :cost    
      end
    end
  end