# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
  	account_id {FactoryBot.create(:account).id}
    txn_type { 'W' or 'D' }
    txn_mode { 'IBPS' or 'NEFT' or 'CARD' }
    amount { '100' }
  end
end
