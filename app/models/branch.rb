class Branch < ApplicationRecord
 belongs_to :bank
 has_many   :users
 validates  :IFSC, presence: true, length: {maximum: 5}
 validates  :address, presence: true, length: {maximum: 15}
 validates  :number, presence: true, length: {maximum: 10}
end