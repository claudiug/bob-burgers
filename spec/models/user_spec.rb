# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  team_id         :integer
#  password_digest :string
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with name an email field' do
    user = FactoryGirl.build(:user)
    expect(user).to be_valid
  end

  it 'is invalid without name field' do
    user = FactoryGirl.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include "can't be blank", "is too short (minimum is 3 characters)"
  end

  it 'is invalid without email field' do
    user = FactoryGirl.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include "can't be blank"
  end

  it 'is invalid less than 3 for name field' do
    user = FactoryGirl.build(:user, name: "a")
    user.valid?
    expect(user.errors[:name]).to include "is too short (minimum is 3 characters)"
  end

  it 'is invalid more than 100 for name field' do
    user = FactoryGirl.build(:user, name: "a" * 101)
    user.valid?
    expect(user.errors[:name]).to include "is too long (maximum is 100 characters)"
  end

  it 'is invalid when name is not unique' do
    FactoryGirl.create(:user, name: 'foo')
    user = FactoryGirl.build(:user, name: 'foo')
    user.valid?
    expect(user.errors[:name]).to include "has already been taken"
  end

  it 'is invalid when email is not unique' do
    FactoryGirl.create(:user, email: 'foo@foo.com')
    user = FactoryGirl.build(:user, email: 'foo@foo.com')
    user.valid?
    expect(user.errors[:email]).to include "has already been taken"
  end

  it 'should be able to be assing to a team' do
    t = FactoryGirl.create(:team, name: 'team')
    u = FactoryGirl.create(:user, name: "fsf", email: 'email@example.net')
    t.users << u
    expect(u.team).not_to be_nil
    expect(u.team.name).to eq 'team'
  end

  it 'should be able to assing a user to a department' do
    d = FactoryGirl.create(:department, name: 'hmm')
    d1 = FactoryGirl.create(:department, name: 'foo')
    u = FactoryGirl.create(:user, name: 'foo1', email: 'email@emaul.com')
    u.departments << [d, d1]
    expect(u.departments.pluck(:name)).to eq ['hmm','foo']
  end
end
