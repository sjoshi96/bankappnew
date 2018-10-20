# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  context 'GET#index' do
    it 'should show all accounts successfully' do
      account1 = FactoryBot.create(:account)
      account2 = FactoryBot.create(:account)
      get :index, format: 'json'
      assigns(:account).should include account1
      assigns(:account).should include account2
      response.should have_http_status(:ok)
    end
  end

  context 'GET#show' do
    it 'should get account successfully' do
      account = FactoryBot.create(:account)
      get :show, params: { id: account.id }, format: 'json'
      assigns(:account).should eq account
      response.should have_http_status(:ok)
    end

    it 'should not get invalid account' do
      get :show, params: { id: '12345' }, format: 'json'
      response.should have_http_status(:not_found)
    end
  end

  context 'GET#new' do
    it 'should get new account successfully' do
      get :new, format: 'json'
      assigns(:account).id.should eq nil
      assigns(:account).act_type.should eq nil
      assigns(:account).balance.should eq nil
      assigns(:account).number.should eq nil
      response.should have_http_status(:ok)
    end
  end
  context 'GET#edit' do
    it 'should get correct account successfully' do
      account = FactoryBot.create(:account)
      get :edit, params: { id: account.id },format: 'json'
      assigns(:account).should eq account
      response.should have_http_status(:ok)
    end

    it 'should not get account with invalid id' do
      get :edit, params: { id: '12345' },format: 'json'
      response.should have_http_status(:not_found)
    end
  end
  context 'POST#create' do
    # it 'should create account successfully' do
    #   account = FactoryBot.create(:account)
    #   post :create, account: { account_type: account.account_type ,amount: account.amount },format: 'json'
    #   assigns(:account).account_type.should eq account.account_type
    #   assigns(:account).amount.should eq account.amount
    #   assigns(:account).number.should eq account.number
    #   response.should have_http_status(:created)
    # end

    it 'should not create account with invalid inputs' do
      post :create, params: { account: { act_type: nil, balance: nil, number: nil } }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  #  context 'PUT#update' do
  #   it 'should update account successfully' do
  #     account1 = FactoryBot.create(:account)
  #     account2 = FactoryBot.create(:account)
  #     put :update,params: {id: account1.id},body: {account: { account_type: account2.account_type,amount: account2.amount,number: account2.number}},format: 'json'
  #     assigns(:account).id.should eq account1.id
  #     assigns(:account).account_type.should eq account2.account_type
  #     assigns(:account).amount.should eq account2.amount
  #     assigns(:account).number.should eq account2.number
  #     response.should have_http_status(:ok)
  #   end

  #   it 'should not update account with invalid inputs' do
  #     account1 = FactoryBot.create(:account)
  #     put :update,params: {id: account1.id}, account: { account_type: nil,amount: nil,number: nil },format: 'json'
  #     response.should have_http_status(:unprocessable_entity)
  #   end

  #   it 'should not update account with invalid account' do
  #     account = FactoryBot.create(:account)
  #     put :update,params: {id: '123456'}, account: { account_type: account.account_type,amount: account.amount,number: account.number },format: 'json'
  #     response.should have_http_status(:unprocessable_entity)
  #   end
  # end
end
