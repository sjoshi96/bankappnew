# frozen_string_literal: true

FactoryBot.define do
  factory :branch do
    IFSC { Faker::Number.number(5) }
    address { Faker::Name.first_name }
    number { Faker::Number.number(10) }
  end
end
