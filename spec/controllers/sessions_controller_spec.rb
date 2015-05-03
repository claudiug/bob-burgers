require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'render the proper template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    it 'login the user with email and password' do
      user = FactoryGirl.create(:user)
      post :create, {email: user.email, password: user.password}
      expect(response).to redirect_to user_path(user)
    end

    it 'render the proper template when data is invalid' do
      user = FactoryGirl.create(:user)
      post :create, {email: 'hmm', password: user.password}
      expect(response).to render_template(:new)
    end
  end
  
  describe  'DELETE #destroy' do
    xit 'redirects to ' do

    end
  end

end
