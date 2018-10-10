class Account < ApplicationRecord
 belongs_to :user
 has_many   :transactions
 has_one    :card
 validates  :balance, presence: true, length: {maximum: 15}, numericality: true
 validates  :act_type, presence: true, length: {maximum: 15},inclusion: { in: %w(savings current)}
 validates  :number, presence: true, length: {maximum: 10}
 validate   :balance_is_valid
  
 private
   
 def balance_is_valid
  if self.balance < 1000
    errors.add(:balance, "should be greater than 1000")
  end
 end 
end