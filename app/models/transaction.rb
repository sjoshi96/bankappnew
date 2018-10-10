class Transaction < ApplicationRecord
 belongs_to :account
 validates  :txn_type, presence: true, length: {maximum: 1}, inclusion: { in: %w(W D)}
 validates  :txn_mode, presence: true, length: {maximum: 5}, inclusion: { in: %w(NEFT IBPS CARD)}
 validates  :amount, presence: true,length: {maximum: 10}
 validate   :is_withdrawl_valid
 validate   :is_withdrawl_amount_valid
 after_save :change_balance
 
 private
  
 def is_withdrawl_valid
  if self.txn_type == "W"
    if self.amount > self.account.balance
      errors.add(:amount, "should be less than available balance")
    end 
  end
 end 

  def is_withdrawl_amount_valid
  if self.txn_type == "W"
    if self.amount < 100
      errors.add(:amount, "should be more than 100")
    end 
  end
 end 
      
 def change_balance
  if self.txn_type == "W"
    new_balance = self.account.balance - self.amount
  else
    new_balance = self.account.balance + self.amount
  end
  
  unless self.account.update_attributes(balance: new_balance)
    raise "Transaction Incomplete"
  end 
 end
end