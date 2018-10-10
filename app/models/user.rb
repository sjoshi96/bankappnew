class User < ApplicationRecord
 has_many  :accounts
 has_many  :loans
 validates :number, presence: true , numericality:{only_integer: true} , length: {maximum: 10}
 validates :age, presence: true , numericality:{only_integer: true} , length: {maximum: 3}
 validates :name, presence: true, length: {maximum: 10}
end