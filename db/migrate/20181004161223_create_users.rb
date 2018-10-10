class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
     t.references :branch, index: true, foreign_key: true
     t.integer   :number
     t.integer   :age
     t.string    :name
     t.timestamps
    end
  end
end
