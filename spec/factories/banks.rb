# frozen_string_literal: true

FactoryBot.define do
  factory :bank do
    name { Faker::Name.first_name }
    address { Faker::Name.first_name }
    number { Faker::Number.number(10) }
  end
end
