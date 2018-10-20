# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LoansController, type: :controller do
  context 'GET#index' do
    it 'should show all loans successfully' do
      loan1 = FactoryBot.create(:loan)
      loan2 = FactoryBot.create(:loan)
      get :index, format: 'json'
      assigns(:loan).should include loan1
      assigns(:loan).should include loan2
      response.should have_http_status(:ok)
    end
  end

  context 'GET#show' do
    it 'should get loan successfully' do
      loan = FactoryBot.create(:loan)
      get :show, params: { id: loan.id }, format: 'json'
      assigns(:loan).should eq loan
      response.should have_http_status(:ok)
    end

    it 'should not get invalid loan' do
      get :show, params: { id: '12345' }, format: 'json'
      response.should have_http_status(:not_found)
    end
  end

  context 'GET#new' do
    it 'should get new loan successfully' do
      get :new, format: 'json'
      assigns(:loan).id.should eq nil
      assigns(:loan).loan_type.should eq nil
      assigns(:loan).amount.should eq nil
      response.should have_http_status(:ok)
    end
  end
  context 'GET#edit' do
    it 'should get correct loan successfully' do
      loan = FactoryBot.create(:loan)
      get :edit, params: { id: loan.id },format: 'json'
      assigns(:loan).should eq loan
      response.should have_http_status(:ok)
    end

    it 'should not get loan with invalid id' do
      get :edit, params: { id: '12345' },format: 'json'
      response.should have_http_status(:not_found)
    end
  end
  context 'POST#create' do
    # it 'should create loan successfully' do
    #   loan = FactoryBot.create(:loan)
    #   post :create, loan: { loan_type: loan.loan_type ,amount: loan.amount },format: 'json'
    #   assigns(:loan).loan_type.should eq loan.loan_type
    #   assigns(:loan).amount.should eq loan.amount
    #   assigns(:loan).number.should eq loan.number
    #   response.should have_http_status(:created)
    # end

    it 'should not create loan with invalid inputs' do
      post :create, params: { loan: { loan_type: nil, amount: nil } }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  #  context 'PUT#update' do
  #   it 'should update loan successfully' do
  #     loan1 = FactoryBot.create(:loan)
  #     loan2 = FactoryBot.create(:loan)
  #     put :update,params: {id: loan1.id},body: {loan: { loan_type: loan2.loan_type,amount: loan2.amount,number: loan2.number}},format: 'json'
  #     assigns(:loan).id.should eq loan1.id
  #     assigns(:loan).loan_type.should eq loan2.loan_type
  #     assigns(:loan).amount.should eq loan2.amount
  #     assigns(:loan).number.should eq loan2.number
  #     response.should have_http_status(:ok)
  #   end

  #   it 'should not update loan with invalid inputs' do
  #     loan1 = FactoryBot.create(:loan)
  #     put :update,params: {id: loan1.id}, loan: { loan_type: nil,amount: nil,number: nil },format: 'json'
  #     response.should have_http_status(:unprocessable_entity)
  #   end

  #   it 'should not update loan with invalid loan' do
  #     loan = FactoryBot.create(:loan)
  #     put :update,params: {id: '123456'}, loan: { loan_type: loan.loan_type,amount: loan.amount,number: loan.number },format: 'json'
  #     response.should have_http_status(:unprocessable_entity)
  #   end
  # end
end
