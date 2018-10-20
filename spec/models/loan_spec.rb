# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Loan, type: :model do
  it 'Loan amount shouldnt be blank' do
    expect(FactoryBot.build(:loan, amount: '')).to be_invalid
  end
  it 'Loan amt shouldnt be nil' do
    expect(FactoryBot.build(:loan, amount: 'nil')).to be_invalid
  end
  it 'Loan type should be valid' do
    expect(FactoryBot.build(:loan, loan_type: 'House')).to be_valid
  end
end
