class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
   create_table :transactions do |t|
    t.references :account, index: true, foreign_key: true
    t.string     :txn_type
    t.string     :txn_mode
    t.integer    :amount
    t.timestamps
   end
  end
end
