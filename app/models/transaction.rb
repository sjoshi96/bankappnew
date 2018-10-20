# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :account
  validates  :txn_type, presence: true, length: { maximum: 1 }, inclusion: { in: %w[W D] }
  validates  :txn_mode, presence: true, length: { maximum: 5 }, inclusion: { in: %w[NEFT IBPS CARD] }
  validates  :amount, presence: true, length: { maximum: 10 }
  validate   :is_withdrawl_valid
  validate   :is_withdrawl_amount_valid
  after_save :change_balance

  private

  def is_withdrawl_valid
    if txn_type == 'W'
      if amount > account.balance
        errors.add(:amount, 'should be less than available balance')
      end
    end
  end

  def is_withdrawl_amount_valid
    if txn_type == 'W'
      errors.add(:amount, 'should be more than 100') if amount < 0
    end
 end

  def change_balance
    new_balance = if txn_type == 'W'
                    account.balance - amount
                  else
                    account.balance + amount
                  end

    unless account.update_attributes(balance: new_balance)
      raise 'Transaction Incomplete'
    end
  end
end
