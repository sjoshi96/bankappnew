class Card < ApplicationRecord
 belongs_to :account
 validates  :card_type, presence: true, length: {maximum: 10}, inclusion: { in: %w(credit debit)}
 validates  :number, presence: true,length: {maximum: 10}
end