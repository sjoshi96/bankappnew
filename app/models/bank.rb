class Bank < ApplicationRecord
 has_many  :branches, dependent: :destroy
 validates :name, presence: true, length: {maximum: 15}
 validates :address, presence: true, length: {maximum: 15}
 validates :number, presence: true, length: {maximum: 10}
end