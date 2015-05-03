require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'should render template new' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a new User to @user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'GET #show' do
    it 'assign the requested user to user' do
      user = FactoryGirl.create(:user)
      get :show, id: user
      expect(assigns(:user)).to eq user
    end

    it 'render the proper template' do
      user = FactoryGirl.create(:user)
      get :show, id: user
      expect(response).to render_template(:show)
    end
  end

  describe 'POST #create' do

    it 'save the team in database' do
      expect{
        post :create, user: FactoryGirl.attributes_for(:user)
      }.to change(User, :count).by(1)
    end

    it 'redirect to show method if the team is saved' do
      post :create, user: FactoryGirl.attributes_for(:user)
      expect(response).to redirect_to user_path(assigns(:user))
    end

    it 'does not the save the contact in db with invalid data' do
      expect {
        post :create, user: FactoryGirl.attributes_for(:user, name: nil)
      }.not_to change(User, :count)
    end

    it 'render the new template when the contact is invalid' do
      post :create, user: FactoryGirl.attributes_for(:user, name: nil)
      expect(response).to render_template(:new)
    end
  end

end
