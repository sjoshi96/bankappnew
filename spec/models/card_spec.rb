# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Card, type: :model do
  it 'Card type shouldnt be blank' do
    expect(FactoryBot.build(:card, card_type: '')).to be_invalid
  end
  it 'Card type shouldnt be nil' do
    expect(FactoryBot.build(:card, card_type: 'nil')).to be_invalid
  end
  # it 'Number shouldnt be nil' do
  #   expect(FactoryBot.build(:card, number: 'nil')).to be_invalid
  # end
  it 'Number shouldnt be blank' do
    expect(FactoryBot.build(:branch, number: '')).to be_invalid
  end
end
