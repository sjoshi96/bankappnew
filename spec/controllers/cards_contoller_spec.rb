# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  context 'GET#index' do
    it 'should show all cards successfully' do
      card1 = FactoryBot.create(:card)
      card2 = FactoryBot.create(:card)
      get :index, format: 'json'
      assigns(:card).should include card1
      assigns(:card).should include card2
      response.should have_http_status(:ok)
    end
  end

  context 'GET#show' do
    it 'should get card successfully' do
      card = FactoryBot.create(:card)
      get :show, params: { id: card.id }, format: 'json'
      assigns(:card).should eq card
      response.should have_http_status(:ok)
    end

    it 'should not get invalid card' do
      get :show, params: { id: '12345' }, format: 'json'
      response.should have_http_status(:not_found)
    end
  end

  context 'GET#new' do
    it 'should get new card successfully' do
      get :new, format: 'json'
      assigns(:card).id.should eq nil
      assigns(:card).card_type.should eq nil
      assigns(:card).number.should eq nil
      response.should have_http_status(:ok)
    end
  end
  context 'GET#edit' do
    it 'should get correct card successfully' do
      card = FactoryBot.create(:card)
      get :edit, params: { id: card.id },format: 'json'
      assigns(:card).should eq card
      response.should have_http_status(:ok)
    end

    it 'should not get card with invalid id' do
      get :edit, params: { id: '12345' },format: 'json'
      response.should have_http_status(:not_found)
    end
  end
  context 'POST#create' do
    # it 'should create card successfully' do
    #   card = FactoryBot.create(:card)
    #   post :create,params: { card: { number: card.number, card_type: card.card_type }},format: 'json'
    #   assigns(:card).card_type.should eq card.card_type
    #   assigns(:card).number.should eq card.number
    #   assigns(:card).number.should eq card.number
    #   response.should have_http_status(:created)
    # end

    it 'should not create card with invalid inputs' do
      post :create, params: { card: { card_type: nil, number: nil } }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

   # context 'PUT#update' do
  #   it 'should update card successfully' do
  #     card1 = FactoryBot.create(:card)
  #     card2 = FactoryBot.create(:card)
  #     put :update,params: {id: card1.id},body: {card: { card_type: card2.card_type,number: card2.number,number: card2.number}},format: 'json'
  #     assigns(:card).id.should eq card1.id
  #     assigns(:card).card_type.should eq card2.card_type
  #     assigns(:card).number.should eq card2.number
  #     assigns(:card).number.should eq card2.number
  #     response.should have_http_status(:ok)
  #   end

    # it 'should not update card with invalid inputs' do
    #   card1 = FactoryBot.create(:card)
    #   put :update,params: {id: card1.id}, params: {card: { card_type: nil,number: nil,number: nil }},format: 'json'
    #   response.should have_http_status(:unprocessable_entity)
    # end

  #   it 'should not update card with invalid card' do
  #     card = FactoryBot.create(:card)
  #     put :update, params: {id: '123456'}, params: {card: { card_type: card.card_type,number: card.number,number: card.number }},format: 'json'
  #     response.should have_http_status(:unprocessable_entity)
  #   end
  # end
end
