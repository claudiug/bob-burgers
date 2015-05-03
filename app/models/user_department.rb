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

class UserDepartment < ActiveRecord::Base
  belongs_to :user
  belongs_to :department

  before_save :get_user_team

  def get_user_team
    self.user_team = user.team.name unless user.team.nil?
  end
end
