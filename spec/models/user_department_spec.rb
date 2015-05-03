# == Schema Information
#
# Table name: user_departments
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  department_id :integer
#  user_team     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe UserDepartment, type: :model do
  it 'should have the proper user_id and department_id when creating a user' do
    u = FactoryGirl.create(:user)
    d = FactoryGirl.create(:department)
    u.departments << d
    ud = UserDepartment.find_by(user_id: u.id)
    expect([ud.user_id, ud.department_id]).to eq [u.id, d.id]
  end

  it 'shoudl store the team name if a user ha a team' do
    t = FactoryGirl.create(:team, name: 'foo')
    u = FactoryGirl.create(:user, name: 'uuu', email: 'email@email.com')
    u.team = t
    u.save!
    d = FactoryGirl.create(:department, name: 'dep')
    d.users << u
    expect(UserDepartment.find_by(user_id: u.id).user_team).to eq 'foo'
  end
end
