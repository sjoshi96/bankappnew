# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    number { Faker::Number.number(10) }
    name { Faker::Name.first_name }
    age { Faker::Number.number(3) }
  end
end
