# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it 'Txn type shouldnt be nil' do
    expect(FactoryBot.build(:transaction, txn_type: 'nil')).to be_invalid
  end
  it 'Txn mode shouldnt be nil' do
    expect(FactoryBot.build(:transaction, txn_mode: 'nil')).to be_invalid
  end
  # it 'Amount shouldnt be nil' do
  #   expect(FactoryBot.build(:transaction, amount: '')).to be_invalid
  # end
  it 'has a valid factory' do
    a = FactoryBot.create(:account)
    t = FactoryBot.create(:transaction, account_id: a.id)
    expect(t).to be_valid
  end
  it 'has a error' do
    a = FactoryBot.create(:account, balance: '1')
    expect(FactoryBot.build(:transaction, txn_type: 'W', account_id: a.id)).to be_invalid
  end
  it 'updates balance on deposit' do
    a = FactoryBot.create(:account, balance: 1000)
    t = FactoryBot.create(:transaction, txn_type: 'D', amount: 10, account_id: a.id)
    fun = a.balance + 10
    expect(t.account.balance).to eq(fun)
  end
  it 'updates balance withdrawal' do
    a = FactoryBot.create(:account, balance: 1000)
    t = FactoryBot.create(:transaction, txn_type: 'W', amount: 10, account_id: a.id)
    fun = a.balance - 10
    expect(t.account.balance).to eq(fun)
end
  
end
