# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :user, optional: true
  has_many   :transactions
  has_one    :card
  validates  :balance, presence: true, length: { maximum: 15 }, numericality: { greater_than_or_equal_to: 0 }
  validates  :act_type, presence: true, length: { maximum: 15 }, inclusion: { in: %w[savings current] }
  validates  :number, presence: true, length: { maximum: 10 }
  
end
