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

FactoryGirl.define do
  factory :department do
    name "MyString"
description "MyString"
  end

end
