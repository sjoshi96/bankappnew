class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
   create_table :accounts do |t|
    t.references :user, index: true, foreign_key: true
    t.decimal    :balance
    t.string     :act_type
    t.integer    :number
    t.timestamps
   end
  end
end
