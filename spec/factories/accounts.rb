# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    balance { Faker::Number.number(3) }
    act_type { 'savings' }
    number { Faker::Number.number(3) }
    user_id { FactoryBot.create(:user).id }
  end
end
