class Loan < ApplicationRecord
 belongs_to :user
 validates  :loan_type, presence: true, length: {maximum: 10}
 validates  :amount, presence: true,length: {maximum: 10}, numericality: {only_integer: true}
end