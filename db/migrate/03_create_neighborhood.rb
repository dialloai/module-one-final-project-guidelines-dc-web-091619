class CreateNeighborhood < ActiveRecord::Migration[5.2]
    def change
      create_table :neighborhoods do |table|
        table.string :location   
      end
    end
  end