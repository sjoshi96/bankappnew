# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BranchesController, type: :controller do
  context 'GET#index' do
    it 'should show all branches successfully' do
      branch1 = FactoryBot.create(:branch)
      branch2 = FactoryBot.create(:branch)
      get :index, format: 'json'
      assigns(:branch).should include branch1
      assigns(:branch).should include branch2
      response.should have_http_status(:ok)
    end
  end

  context 'GET#show' do
    it 'should get branch successfully' do
      branch = FactoryBot.create(:branch)
      get :show, params: { id: branch.id }, format: 'json'
      assigns(:branch).should eq branch
      response.should have_http_status(:ok)
    end

    it 'should not get invalid branch' do
      get :show, params: { id: '12345' }, format: 'json'
      response.should have_http_status(:not_found)
    end
  end

  context 'GET#new' do
    it 'should get new branch successfully' do
      get :new, format: 'json'
      assigns(:branch).id.should eq nil
      assigns(:branch).IFSC.should eq nil
      assigns(:branch).address.should eq nil
      assigns(:branch).number.should eq nil
      response.should have_http_status(:ok)
    end
  end
  context 'GET#edit' do
    it 'should get correct branch successfully' do
      branch = FactoryBot.create(:branch)
      get :edit, params: { id: branch.id },format: 'json'
      assigns(:branch).should eq branch
      response.should have_http_status(:ok)
    end

    it 'should not get branch with invalid id' do
      get :edit, params: { id: '12345' },format: 'json'
      response.should have_http_status(:not_found)
    end
  end
  context 'POST#create' do
    # it 'should create branch successfully' do
    #   branch = FactoryBot.create(:branch)
    #   post :create, branch: { IFSC: branch.IFSC ,address: branch.address },format: 'json'
    #   assigns(:branch).IFSC.should eq branch.IFSC
    #   assigns(:branch).address.should eq branch.address
    #   assigns(:branch).number.should eq branch.number
    #   response.should have_http_status(:created)
    # end

    it 'should not create branch with invalid inputs' do
      post :create, params: { branch: { IFSC: nil, address: nil, number: nil } }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  #  context 'PUT#update' do
  #   it 'should update branch successfully' do
  #     branch1 = FactoryBot.create(:branch)
  #     branch2 = FactoryBot.create(:branch)
  #     put :update,params: {id: branch1.id},body: {branch: { IFSC: branch2.IFSC,address: branch2.address,number: branch2.number}},format: 'json'
  #     assigns(:branch).id.should eq branch1.id
  #     assigns(:branch).IFSC.should eq branch2.IFSC
  #     assigns(:branch).address.should eq branch2.address
  #     assigns(:branch).number.should eq branch2.number
  #     response.should have_http_status(:ok)
  #   end

  #   it 'should not update branch with invalid inputs' do
  #     branch1 = FactoryBot.create(:branch)
  #     put :update,params: {id: branch1.id}, branch: { IFSC: nil,address: nil,number: nil },format: 'json'
  #     response.should have_http_status(:unprocessable_entity)
  #   end

  #   it 'should not update branch with invalid branch' do
  #     branch = FactoryBot.create(:branch)
  #     put :update,params: {id: '123456'}, branch: { IFSC: branch.IFSC,address: branch.address,number: branch.number },format: 'json'
  #     response.should have_http_status(:unprocessable_entity)
  #   end
  # end
end
