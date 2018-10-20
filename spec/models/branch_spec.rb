# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Branch, type: :model do
  it 'IFSC not to be blank' do
    expect(FactoryBot.build(:branch, IFSC: '')).to be_invalid
  end
  it 'IFSC shouldnt nil' do
    expect(FactoryBot.build(:branch, IFSC: nil)).to be_invalid
  end
  it 'IFSC not greater than 10' do
    expect(FactoryBot.build(:branch, IFSC: '123456789088')).to be_invalid
  end
  it 'Number should not greater than 10' do
    expect(FactoryBot.build(:branch, number: '123456789088')).to be_invalid
  end
  it 'Number shouldnt be nil' do
    expect(FactoryBot.build(:branch, number: '')).to be_invalid
  end
  it 'Address shouldnt be nil' do
    expect(FactoryBot.build(:branch, address: nil)).to be_invalid
  end
  it 'Number shouldnt be blank' do
    expect(FactoryBot.build(:branch, address: '')).to be_invalid
  end
end
