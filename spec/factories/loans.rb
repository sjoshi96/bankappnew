# frozen_string_literal: true

FactoryBot.define do
  factory :loan do
  	user_id {FactoryBot.create(:user).id}
    loan_type {Faker::Name.first_name }
    amount { Faker::Number.number(10) }
  end
end
