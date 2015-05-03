require 'rails_helper'

RSpec.describe TeamsController, type: :controller do

  before(:each) do
    user = FactoryGirl.create(:user)
    expect(controller).to receive(:authorize).and_return(user)
  end

  describe 'GET #new' do
    it 'should render template new' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a new Team to @team' do
      get :new
      expect(assigns(:team)).to be_a_new(Team)
    end
  end

  describe 'GET #show' do
    it 'assign the requested team to @team' do
      team = FactoryGirl.create(:team)
      get :show, id: team
      expect(assigns(:team)).to eq team
    end

    it 'render the proper templates for show' do
      team = FactoryGirl.create(:team)
      get :show, id: team
      expect(response).to render_template(:show)
    end
  end

  describe 'POST #create' do

    it 'save the team in database' do
      expect{
        post :create, team: FactoryGirl.attributes_for(:team)
      }.to change(Team, :count).by(1)
    end

    it 'redirect to show method if the team is saved' do
      post :create, team: FactoryGirl.attributes_for(:team)
      expect(response).to redirect_to team_path(assigns(:team))
    end

    it 'does not the save the contact in db with invalid data' do
      expect {
        post :create, team: FactoryGirl.attributes_for(:team, name: nil)
      }.not_to change(Team, :count)
    end

    it 'render the new template when the contact is invalid' do
      post :create, team: FactoryGirl.attributes_for(:team, name: nil)
      expect(response).to render_template(:new)
    end
  end
end
