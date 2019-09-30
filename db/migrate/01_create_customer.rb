class CreateCustomer < ActiveRecord::Migration[5.2]
    def change
      create_table :customers do |table|
        table.string :name
        table.string :username        
      end
    end
  end