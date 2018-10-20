# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account, type: :model do
  it 'Valid Number' do
    expect(FactoryBot.build(:account, number: 345_654)).to be_valid
  end
  it 'Account type' do
    expect(FactoryBot.build(:account, act_type: 'crdit')).to be_invalid
  end
  it 'Valid balance' do
    expect(FactoryBot.build(:account, balance: 'nil')).to be_invalid
  end
  it 'Account type' do
    expect(FactoryBot.build(:account, balance: 'zero')).to be_invalid
  end
  it 'Number is Valid' do
    expect(FactoryBot.build(:account, number: 123_456)).to be_valid
  end
end
