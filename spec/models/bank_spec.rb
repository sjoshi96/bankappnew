# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Bank, type: :model do
  it 'Valid Bank Name' do
    expect(FactoryBot.build(:bank, name: '')).to be_invalid
  end
  it 'Valid Bank Name' do
    expect(FactoryBot.build(:bank, name: nil)).to be_invalid
  end
  it 'Valid  Number' do
    expect(FactoryBot.build(:bank, number: nil)).to be_invalid
  end
  it 'Valid Number' do
    expect(FactoryBot.build(:bank, name: '')).to be_invalid
  end
  it 'Valid Addresss' do
    expect(FactoryBot.build(:bank, name: '')).to be_invalid
  end
  it 'Valid Bank Name' do
    expect(FactoryBot.build(:bank, name: nil)).to be_invalid
  end
end
