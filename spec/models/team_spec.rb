# == Schema Information
#
# Table name: teams
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Team, type: :model do

  it 'is valid with name field' do
    team = FactoryGirl.build(:team)
    expect(team).to be_valid
  end

  it 'is invalid with no name' do
    team = FactoryGirl.build(:team, name: nil)
    team.valid?
    expect(team.errors[:name]).to include "can't be blank", "is too short (minimum is 3 characters)"
  end

  it 'must have minimum 3 chars'do
    team = FactoryGirl.build(:team, name: "a")
    team.valid?
    expect(team.errors[:name]).to include "is too short (minimum is 3 characters)"
  end

  it 'must have maximim 3 chars'do
    team = FactoryGirl.build(:team, name: "a"* 101)
    team.valid?
    expect(team.errors[:name]).to include "is too long (maximum is 100 characters)"
  end

  it 'should have the name uniq' do
    FactoryGirl.create(:team, name: 'foo')
    team = FactoryGirl.build(:team, name: 'foo')
    team.valid?
    expect(team.errors[:name]).to include "has already been taken"
  end

  it 'should be able to add users to a team' do
    u = FactoryGirl.create(:user, name: 'foo1', email: 'foo@foo.com')
    u1 = FactoryGirl.create(:user, name: 'foo2', email: 'foo@foo1.com')
    t = FactoryGirl.create(:team)
    t.users << u
    t.users << u1
    expect(t.users.count).to eq 2
  end

  it 'should be able to add departments to a team' do
    d = FactoryGirl.create(:department)
    d1 = FactoryGirl.create(:department)
    t = FactoryGirl.create(:team)
    t.departments << d
    t.departments << d1
    expect(t.departments.count).to eq 2
  end
end
