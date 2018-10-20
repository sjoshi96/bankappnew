# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BanksController, type: :controller do
  context 'GET#index' do
    it 'should show all banks successfully' do
      bank1 = FactoryBot.create(:bank)
      bank2 = FactoryBot.create(:bank)
      get :index, format: 'json'
      assigns(:bank).should include bank1
      assigns(:bank).should include bank2
      response.should have_http_status(:ok)
    end
  end

  context 'GET#show' do
    it 'should get bank successfully' do
      bank = FactoryBot.create(:bank)
      get :show, params: { id: bank.id }, format: 'json'
      assigns(:bank).should eq bank
      response.should have_http_status(:ok)
    end

    it 'should not get invalid bank' do
      get :show, params: { id: '12345' }, format: 'json'
      response.should have_http_status(:not_found)
    end
  end

  context 'GET#new' do
    it 'should get new bank successfully' do
      get :new, format: 'json'
      assigns(:bank).id.should eq nil
      assigns(:bank).name.should eq nil
      assigns(:bank).address.should eq nil
      assigns(:bank).number.should eq nil
      response.should have_http_status(:ok)
    end
  end
  context 'GET#edit' do
    it 'should get correct bank successfully' do
      bank = FactoryBot.create(:bank)
      get :edit, params: { id: bank.id }, format: 'json'
      assigns(:bank).should eq bank
      response.should have_http_status(:ok)
    end

    it 'should not get bank with invalid id' do
      get :edit, params: { id: '12345' }, format: 'json'
      response.should have_http_status(:not_found)
    end
  end
  context 'POST#create' do
    # it 'should create bank successfully' do
    #   bank = FactoryBot.create(:bank)
    #   post :create, params: {bank: { name: bank.name ,address: bank.address, number: bank.number }},format: 'json'
    #   assigns(:bank).name.should eq bank.name
    #   assigns(:bank).address.should eq bank.address
    #   # assigns(:bank).number.should eq bank.number
    #   response.should have_http_status(:created)
    # end

    it 'should not create bank with invalid inputs' do
      post :create, params: { bank: { name: nil, address: nil, number: nil } }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  #  context 'PUT#update' do
  #   it 'should update bank successfully' do
  #     bank1 = FactoryBot.create(:bank)
  #     bank2 = FactoryBot.create(:bank)
  #     put :update,params: {id: bank1.id},body: {bank: { name: bank2.name,address: bank2.address,number: bank2.number}},format: 'json'
  #     assigns(:bank).id.should eq bank1.id
  #     assigns(:bank).name.should eq bank2.name
  #     assigns(:bank).address.should eq bank2.address
  #     assigns(:bank).number.should eq bank2.number
  #     response.should have_http_status(:ok)
  #   end

  #   it 'should not update bank with invalid inputs' do
  #     bank1 = FactoryBot.create(:bank)
  #     put :update,params: {id: bank1.id}, bank: { name: nil,address: nil,number: nil },format: 'json'
  #     response.should have_http_status(:unprocessable_entity)
  #   end

  #   it 'should not update bank with invalid bank' do
  #     bank = FactoryBot.create(:bank)
  #     put :update,params: {id: '123456'}, bank: { name: bank.name,address: bank.address,number: bank.number },format: 'json'
  #     response.should have_http_status(:unprocessable_entity)
  #   end
  # end
end
