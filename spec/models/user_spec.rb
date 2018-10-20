# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Valid Name' do
    expect(FactoryBot.build(:user, name: nil)).to be_invalid
  end
  it 'Valid Age' do
    expect(FactoryBot.build(:user, age: '2345')).to be_invalid
  end
  it 'Valid Name' do
    expect(FactoryBot.build(:user, name: '')).to be_invalid
  end
  it 'Valid age' do
    expect(FactoryBot.build(:user, age: 'nine')).to be_invalid
  end
  it 'Valid name' do
    expect(FactoryBot.build(:user, name: 'wfsgshsbsbsg')).to be_invalid
  end
  it 'Valid number' do
    expect(FactoryBot.build(:user, number: '1498774646464')).to be_invalid
  end
end
