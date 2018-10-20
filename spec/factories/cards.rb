# frozen_string_literal: true

FactoryBot.define do
  factory :card do
  	account_id {FactoryBot.create(:account).id}
    card_type { 'credit' or 'debit' }
    number { Faker::Number.number(10) }
  end
end
