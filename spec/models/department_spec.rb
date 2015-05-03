# == Schema Information
#
# Table name: departments
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  team_id     :integer
#

require 'rails_helper'

RSpec.describe Department, type: :model do
  it 'is valid with proper filed' do
    dep = FactoryGirl.build(:department)
    expect(dep).to be_valid
  end

  it 'is invalid with no name' do
    dep = FactoryGirl.build(:department, name: nil)
    dep.valid?
    expect(dep.errors[:name]).to include "can't be blank", "is too short (minimum is 3 characters)"
  end

  it 'is invalid with no less than 3 chars for name' do
    dep = FactoryGirl.build(:department, name: 'a')
    dep.valid?
    expect(dep.errors[:name]).to include "is too short (minimum is 3 characters)"
  end

  it 'is invalid with more than 100 chars for name' do
    dep = FactoryGirl.build(:department, name: 'a' * 101)
    dep.valid?
    expect(dep.errors[:name]).to include "is too long (maximum is 100 characters)"
  end

  it 'is valid with no description' do
    dep = FactoryGirl.build(:department, description: nil)
    expect(dep).to be_valid
  end

  it 'is invalid with more than 1000 chars for description'do
    dep = FactoryGirl.build(:department, description: 'a'* 1001)
    dep.valid?
    expect(dep.errors[:description]).to include "is too long (maximum is 1000 characters)"
  end

  it 'should be able to be assing to a team' do
    t = FactoryGirl.create(:team, name: 'foo')
    d = FactoryGirl.create(:department)
    t.departments << d
    expect(d.team).to_not be_nil
    expect(d.team.name).to eq 'foo'
  end

  it 'should be able to assing users to a department' do
    u = FactoryGirl.create(:user, name: 'foo', email: 'foo1@email.com')
    u1 = FactoryGirl.create(:user, name: 'foo1', email: 'foo2@email.com')
    d = FactoryGirl.create(:department)
    d.users << [u, u1]
    expect(d.users.pluck(:name)).to eq ['foo', 'foo1']
  end

  it 'should be able to assing stories to a department' do
    s = FactoryGirl.create(:story, title: 'foo')
    s1 = FactoryGirl.create(:story, title: 'foo1')
    d = FactoryGirl.create(:department)
    d.stories << [s, s1]
    expect(d.stories.count).to eq 2
    expect(d.stories.pluck(:title)).to eq ['foo', 'foo1']
  end
end
