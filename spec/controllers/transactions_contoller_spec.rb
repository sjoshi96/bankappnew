# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  context 'GET#index' do
    it 'should show all transactions successfully' do
      transaction1 = FactoryBot.create(:transaction)
      transaction2 = FactoryBot.create(:transaction)
      get :index, format: 'json'
      assigns(:transaction).should include transaction1
      assigns(:transaction).should include transaction2
      response.should have_http_status(:ok)
    end
  end

  context 'GET#show' do
    it 'should get transaction successfully' do
      transaction = FactoryBot.create(:transaction)
      get :show, params: { id: transaction.id }, format: 'json'
      assigns(:transaction).should eq transaction
      response.should have_http_status(:ok)
    end

    it 'should not get invalid transaction' do
      get :show, params: { id: '12345' }, format: 'json'
      response.should have_http_status(:not_found)
    end
  end

  context 'GET#new' do
    it 'should get new transaction successfully' do
      get :new, format: 'json'
      assigns(:transaction).id.should eq nil
      assigns(:transaction).txn_type.should eq nil
      assigns(:transaction).amount.should eq nil
      response.should have_http_status(:ok)
    end
  end
  context 'GET#edit' do
    it 'should get correct transaction successfully' do
      transaction = FactoryBot.create(:transaction)
      get :edit, params: { id: transaction.id },format: 'json'
      assigns(:transaction).should eq transaction
      response.should have_http_status(:ok)
    end

    it 'should not get transaction with invalid id' do
      get :edit, params: { id: '12345' },format: 'json'
      response.should have_http_status(:not_found)
    end
  end
  context 'POST#create' do
    # it 'should create transaction successfully' do
    #   transaction = FactoryBot.create(:transaction)
    #   post :create, transaction: { txn_type: transaction.txn_type ,amount: transaction.amount },format: 'json'
    #   assigns(:transaction).txn_type.should eq transaction.txn_type
    #   assigns(:transaction).amount.should eq transaction.amount
    #   response.should have_http_status(:created)
    # end

    it 'should not create transaction with invalid inputs' do
      post :create, params: { transaction: { txn_type: nil, amount: nil } }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
end
