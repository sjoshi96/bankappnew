# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'GET#index' do
    it 'should show all users successfully' do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      get :index, format: 'json'
      assigns(:user).should include user1
      assigns(:user).should include user2
      response.should have_http_status(:ok)
    end
  end

  context 'GET#show' do
    it 'should get user successfully' do
      user = FactoryBot.create(:user)
      get :show, params: { id: user.id }, format: 'json'
      assigns(:user).should eq user
      response.should have_http_status(:ok)
    end

    it 'should not get invalid user' do
      get :show, params: { id: '12345' }, format: 'json'
      response.should have_http_status(:not_found)
    end
  end

  context 'GET#new' do
    it 'should get new user successfully' do
      get :new, format: 'json'
      assigns(:user).id.should eq nil
      assigns(:user).name.should eq nil
      assigns(:user).age.should eq nil
      assigns(:user).number.should eq nil
      response.should have_http_status(:ok)
    end
  end
  context 'GET#edit' do
    it 'should get correct user successfully' do
      user = FactoryBot.create(:user)
      get :edit, params: { id: user.id }, format: 'json'
      assigns(:user).should eq user
      response.should have_http_status(:ok)
    end

    it 'should not get user with invalid id' do
      get :edit, params: { id: '12345' }, format: 'json'
      response.should have_http_status(:not_found)
    end
  end
  context 'POST#create' do
    it 'should create user successfully' do
      user = FactoryBot.create(:user)
      post :create, params: {user: { name: user.name ,age: user.age, number: user.number }},format: 'json'
      assigns(:user).name.should eq user.name
      assigns(:user).age.should eq user.age
      assigns(:user).number.should eq user.number
      response.should have_http_status(:created)
    end

    it 'should not create user with invalid inputs' do
      post :create, params: { user: { name: nil, age: nil, number: nil } }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
end
