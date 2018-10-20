# frozen_string_literal: true

class CreateBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :banks do |t|
      t.string :name
      t.string :address
      t.integer :number
      t.timestamps
    end
 end
end
