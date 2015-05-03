# == Schema Information
#
# Table name: stories
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  hours       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :story do
    title "MyString"
description "MyString"
hours 1
  end

end