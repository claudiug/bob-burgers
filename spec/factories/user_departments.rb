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

FactoryGirl.define do
  factory :user_department do
    
  end

end
